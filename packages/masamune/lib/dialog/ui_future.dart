part of masamune;

class _UIFuture {
  const _UIFuture._();

  static Future<T?> show<T>(
    BuildContext context,
    Future<T> future, {
    Color? barrierColor = Colors.black54,
    void Function(T? value)? actionOnFinish,
    Widget? indicator,
  }) async {
    T? val;
    final dialog = showDialog(
      context: context,
      barrierColor: barrierColor,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: indicator ??
              Center(
                child: context.theme.widget.loadingIndicator
                        ?.call(context, Colors.white.withOpacity(0.5)) ??
                    CircularProgressIndicator(
                      backgroundColor: Colors.white.withOpacity(
                        0.5,
                      ),
                    ),
              ),
        );
      },
    );
    future.then((v) => val = v).whenComplete(
      () async {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    await dialog;
    actionOnFinish?.call(val);
    return val;
  }
}

/// Extension methods for UIFuture.
extension UIFutureOrExtension<T> on FutureOr<T> {
  /// Show indicator and dialog.
  ///
  /// Display an indicator if you are waiting for the task to end.
  ///
  /// [context]: Build context.
  /// [actionOnFinish]: Action after the task is finished.
  FutureOr<T?> showIndicator(
    BuildContext context, {
    Color? barrierColor = Colors.black54,
    void Function(T? value)? actionOnFinish,
    Widget? indicator,
  }) async {
    final futureOr = this;
    if (futureOr is Future<T>) {
      // FIXME: 動作がおかしくなるようであれば修正
      // await Future<void>.delayed(Duration.zero);
      _UIFuture.show<T>(
        context,
        futureOr,
        actionOnFinish: actionOnFinish,
        barrierColor: barrierColor,
        indicator: indicator,
      );
      final value = await this;
      await Future<void>.delayed(Duration.zero);
      return value;
    } else {
      return await this;
    }
  }
}
