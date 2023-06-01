part of masamune_purchase_stripe;

class StripePurchase extends ChangeNotifier {
  StripePurchase({required this.userId});

  final String userId;

  static Completer<void>? _completer;

  static const documentQuery = StripePurchaseModel.document;
  static const collectionQuery = StripePurchaseModel.collection;

  Future<void> create({
    required String orderId,
    required double priceAmount,
    String? targetUserId,
    String? description,
    Locale locale = const Locale("en", "US"),
    Duration timeout = const Duration(seconds: 15),
    String? emailTitleOnRequired3DSecure,
    String? emailContentOnRequired3DSecure,
  }) async {
    if (_completer != null) {
      return _completer!.future;
    }
    _completer = Completer<void>();
    try {
      final modelQuery = collectionQuery(userId: userId).modelQuery;
      final purchaseCollection = $StripePurchaseModelCollection(
        modelQuery.equal(
            StripePurchaseModelCollectionKey.orderId.name, orderId),
      );
      await purchaseCollection.load();
      if (purchaseCollection.isNotEmpty) {
        throw Exception("Billing has already been created.");
      }
      final functionsAdapter =
          StripePurchaseMasamuneAdapter.primary.functionsAdapter ??
              FunctionsAdapter.primary;

      final response = await functionsAdapter.stipe(
        action: StripeCreatePurchaseAction(
          userId: userId,
          priceAmount: priceAmount,
          revenueAmount: StripePurchaseMasamuneAdapter.primary.revenueRatio,
          currency: StripePurchaseMasamuneAdapter.primary.currency,
          targetUserId: targetUserId,
          orderId: orderId,
          description: description,
          email: StripeMail(
            from: StripePurchaseMasamuneAdapter.primary.supportEmail,
            title: emailTitleOnRequired3DSecure ??
                StripePurchaseMasamuneAdapter
                    .primary.threeDSecureOptions.emailTitle,
            content: emailContentOnRequired3DSecure ??
                StripePurchaseMasamuneAdapter
                    .primary.threeDSecureOptions.emailContent,
          ),
          locale: locale,
        ),
      );

      if (response == null || response.purchaseId.isEmpty) {
        throw Exception("Response is invalid.");
      }

      await Future.doWhile(() async {
        await Future.delayed(const Duration(milliseconds: 100));
        await purchaseCollection.reload();
        return purchaseCollection.isNotEmpty;
      }).timeout(timeout);
      _completer?.complete();
      _completer = null;
      notifyListeners();
    } catch (e) {
      _completer?.completeError(e);
      _completer = null;
      rethrow;
    } finally {
      _completer?.complete();
      _completer = null;
    }
  }

  Future<void> refresh({
    required StripePurchaseModel purchase,
  }) async {
    if (_completer != null) {
      return _completer!.future;
    }
    _completer = Completer<void>();
    try {
      if (purchase.success) {
        throw Exception("The payment has already been succeed.");
      }
      if (!purchase.error) {
        return;
      }
      final functionsAdapter =
          StripePurchaseMasamuneAdapter.primary.functionsAdapter ??
              FunctionsAdapter.primary;

      final response = await functionsAdapter.stipe(
        action: StripeRefreshPurchaseAction(
          userId: userId,
          orderId: purchase.orderId,
        ),
      );

      if (response == null) {
        throw Exception("Response is invalid.");
      }
      _completer?.complete();
      _completer = null;
      notifyListeners();
    } catch (e) {
      _completer?.completeError(e);
      _completer = null;
      rethrow;
    } finally {
      _completer?.complete();
      _completer = null;
    }
  }

  Future<void> confirm({
    required DocumentBase<StripePurchaseModel> purchase,
    bool online = true,
    required void Function(
      Uri endpoint,
      Widget webView,
      VoidCallback onClosed,
    ) builder,
    VoidCallback? onClosed,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_completer != null) {
      return _completer!.future;
    }
    _completer = Completer<void>();
    Completer<void>? internalCompleter = Completer<void>();
    try {
      final value = purchase.value;
      if (value == null) {
        throw Exception(
          "Purchase information is empty. Please run [create] method.",
        );
      }
      if (value.error) {
        throw Exception(
          "There has been an error with your payment. Please check and Refresh your payment information once.",
        );
      }
      if (value.canceled) {
        throw Exception("This purchase has already canceled.");
      }
      if (value.confirm && value.verified) {
        throw Exception("This purchase has already confirmed.");
      }
      var language = value.locale?.split("_").firstOrNull;
      if (!StripePurchaseMasamuneAdapter
          .primary.threeDSecureOptions.acceptLanguage
          .contains(language)) {
        language = StripePurchaseMasamuneAdapter
            .primary.threeDSecureOptions.acceptLanguage.first;
      }
      final functionsAdapter =
          StripePurchaseMasamuneAdapter.primary.functionsAdapter ??
              FunctionsAdapter.primary;
      final callbackHost = StripePurchaseMasamuneAdapter
          .primary.callbackURLSchemeOrHost
          .toString()
          .trimQuery()
          .trimString("/");
      final hostingEndpoint = StripePurchaseMasamuneAdapter
              .primary.hostingEndpoint
              ?.call(language!) ??
          callbackHost;
      final returnPathOptions =
          StripePurchaseMasamuneAdapter.primary.returnPathOptions;

      final response = await functionsAdapter.stipe(
        action: StripeConfirmPurchaseAction(
          userId: userId,
          orderId: value.orderId,
          returnUrl: online
              ? Uri.parse(
                  "$callbackHost/${returnPathOptions.finishedOnConfirmPurchase.trimString("/")}")
              : Uri.parse(
                  "${functionsAdapter.endpoint}/${StripePurchaseMasamuneAdapter.primary.threeDSecureOptions.redirectFunctionPath}"),
          failureUrl: Uri.parse(
              "$hostingEndpoint/${StripePurchaseMasamuneAdapter.primary.threeDSecureOptions.failurePath}"),
          successUrl: Uri.parse(
              "$hostingEndpoint/${StripePurchaseMasamuneAdapter.primary.threeDSecureOptions.successPath}"),
        ),
      );

      if (response == null || response.purchaseId.isEmpty) {
        throw Exception("Response is invalid.");
      }
      bool authenticated = true;
      onCompleted() {
        if (authenticated) {
          internalCompleter?.complete();
          internalCompleter = null;
        } else {
          internalCompleter
              ?.completeError(Exception("3D Secure authentication failed."));
          internalCompleter = null;
        }
      }

      final nextAction = response.nextActionUrl?.toString();
      if (nextAction.isNotEmpty) {
        final webView = StripeWebview(
          response.nextActionUrl!,
          shouldOverrideUrlLoading: (url) {
            final path = url.trimQuery().replaceAll(callbackHost, "");
            if (path ==
                "/${returnPathOptions.finishedOnConfirmPurchase.trimString("/")}") {
              onClosed?.call();
              onCompleted();
              return StripeNavigationActionPolicy.cancel;
            }
            final uri = Uri.parse(url);
            if (uri.host == "hooks.stripe.com" &&
                uri.queryParameters.containsKey("authenticated")) {
              authenticated = uri.queryParameters["authenticated"] == "true";
            }
            return StripeNavigationActionPolicy.allow;
          },
          onCloseWindow: () {
            onCompleted();
          },
        );
        builder.call(response.nextActionUrl!, webView, onCompleted);
        await internalCompleter!.future;
      }
      await Future.doWhile(() async {
        await Future.delayed(const Duration(milliseconds: 100));
        await purchase.reload();
        return purchase.value != null &&
            (!purchase.value!.confirm || !purchase.value!.verified);
      }).timeout(timeout);
      _completer?.complete();
      _completer = null;
      internalCompleter?.complete();
      internalCompleter = null;
      notifyListeners();
    } catch (e) {
      _completer?.completeError(e);
      _completer = null;
      internalCompleter?.complete();
      internalCompleter = null;
      rethrow;
    } finally {
      _completer?.complete();
      _completer = null;
      internalCompleter?.complete();
      internalCompleter = null;
    }
  }

  Future<void> capture({
    required DocumentBase<StripePurchaseModel> purchase,
    double? priceAmountOverride,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_completer != null) {
      return _completer!.future;
    }
    _completer = Completer<void>();
    try {
      final value = purchase.value;
      if (value == null) {
        throw Exception(
          "Purchase information is empty. Please run [create] method.",
        );
      }
      if (value.error) {
        throw Exception(
          "There has been an error with your payment. Please check and Refresh your payment information once.",
        );
      }
      if (value.canceled) {
        throw Exception("This purchase has already canceled.");
      }
      if (!value.confirm || !value.verified) {
        throw Exception(
          "The payment has not been confirmed yet. Please confirm the payment by clicking [confirm] and then execute.",
        );
      }
      if (value.captured) {
        throw Exception("This purchase has already captured.");
      }
      if (priceAmountOverride != null && value.amount < priceAmountOverride) {
        throw Exception(
          "You cannot capture an amount higher than the billing amount already saved.",
        );
      }
      final functionsAdapter =
          StripePurchaseMasamuneAdapter.primary.functionsAdapter ??
              FunctionsAdapter.primary;

      final response = await functionsAdapter.stipe(
        action: StripeCapturePurchaseAction(
          userId: userId,
          orderId: value.orderId,
          priceAmountOverride: priceAmountOverride,
        ),
      );

      if (response == null || response.purchaseId.isEmpty) {
        throw Exception("Response is invalid.");
      }
      await Future.doWhile(() async {
        await Future.delayed(const Duration(milliseconds: 100));
        await purchase.reload();
        return purchase.value != null && !purchase.value!.confirm;
      }).timeout(timeout);
      _completer?.complete();
      _completer = null;
      notifyListeners();
    } catch (e) {
      _completer?.completeError(e);
      _completer = null;
      rethrow;
    } finally {
      _completer?.complete();
      _completer = null;
    }
  }

  Future<void> cancel({
    required DocumentBase<StripePurchaseModel> purchase,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_completer != null) {
      return _completer!.future;
    }
    _completer = Completer<void>();
    try {
      final value = purchase.value;
      if (value == null) {
        throw Exception(
          "Purchase information is empty. Please run [create] method.",
        );
      }
      if (value.canceled) {
        throw Exception("This purchase has already canceled.");
      }
      if (value.captured || value.success) {
        throw Exception("The payment has already been completed.");
      }
      final functionsAdapter =
          StripePurchaseMasamuneAdapter.primary.functionsAdapter ??
              FunctionsAdapter.primary;

      final response = await functionsAdapter.stipe(
        action: StripeCancelPurchaseAction(
          userId: userId,
          orderId: value.orderId,
        ),
      );

      if (response == null) {
        throw Exception("Response is invalid.");
      }
      await Future.doWhile(() async {
        await Future.delayed(const Duration(milliseconds: 100));
        await purchase.reload();
        return purchase.value != null && !purchase.value!.canceled;
      }).timeout(timeout);
      _completer?.complete();
      _completer = null;
      notifyListeners();
    } catch (e) {
      _completer?.completeError(e);
      _completer = null;
      rethrow;
    } finally {
      _completer?.complete();
      _completer = null;
    }
  }

  Future<void> refund({
    required DocumentBase<StripePurchaseModel> purchase,
    double? refundAmount,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_completer != null) {
      return _completer!.future;
    }
    _completer = Completer<void>();
    try {
      final value = purchase.value;
      if (value == null) {
        throw Exception(
          "Purchase information is empty. Please run [create] method.",
        );
      }
      if (!value.captured || !value.success) {
        throw Exception("The payment is not yet in your jurisdiction.");
      }
      if (value.refund) {
        throw Exception("The payment is already refunded.");
      }
      if (refundAmount != null && value.amount < refundAmount) {
        throw Exception(
          "The amount to be refunded exceeds the original amount.",
        );
      }
      final functionsAdapter =
          StripePurchaseMasamuneAdapter.primary.functionsAdapter ??
              FunctionsAdapter.primary;

      final response = await functionsAdapter.stipe(
        action: StripeRefundPurchaseAction(
          userId: userId,
          orderId: value.orderId,
          refundAmount: refundAmount,
        ),
      );

      if (response == null) {
        throw Exception("Response is invalid.");
      }
      await Future.doWhile(() async {
        await Future.delayed(const Duration(milliseconds: 100));
        await purchase.reload();
        return purchase.value != null && !purchase.value!.refund;
      }).timeout(timeout);
      _completer?.complete();
      _completer = null;
      notifyListeners();
    } catch (e) {
      _completer?.completeError(e);
      _completer = null;
      rethrow;
    } finally {
      _completer?.complete();
      _completer = null;
    }
  }
}
