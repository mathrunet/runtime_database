part of '/masamune.dart';

/// Create an extension method for [RefHasPage] to handle Query for form.
///
/// フォーム用のQueryを処理するための[RefHasPage]の拡張メソッドを作成します。
extension MasamuneFormRefHasPageExtensions on RefHasPage {
  @Deprecated(
    "It is no longer possible to use [form] by directly specifying [PageRef] or [WidgetRef]. Instead, use [ref.page.form] to specify the scope. [PageRef]や[WidgetRef]を直接指定しての[form]の利用はできなくなります。代わりに[ref.page.form]でスコープを指定しての利用を行ってください。",
  )
  FormController<TModel> form<TModel>(
    ChangeNotifierScopedQueryBase<FormController<TModel>, PageScopedValueRef>
        query,
  ) {
    return page.query(query);
  }
}

/// Create an extension method for [PageScopedValueRef] to handle Query for form.
///
/// フォーム用のQueryを処理するための[PageScopedValueRef]の拡張メソッドを作成します。
extension MasamuneFormPageScopedValueRefExtensions on AppScopedValueOrAppRef {
  /// [FormController] is obtained by passing [FormControllerQueryBase] for the form generated by the builder.
  ///
  /// The state is always saved in page scope.
  ///
  /// ビルダーによりコード生成されたフォーム用の[FormControllerQueryBase]を渡すことにより状態を保持された[FormController]を取得します。
  ///
  /// かならずページスコープで状態が保存されます。
  ///
  /// ```dart
  /// final userController = ref.page.form(UserFormController.query()); // Get the user form controller.
  /// ```
  FormController<TModel> form<TModel>(
    FormControllerQueryBase<TModel> query,
  ) {
    return this.query(query);
  }
}

/// Create an extension method for [QueryScopedValueRef] to handle Query for form.
///
/// フォーム用のQueryを処理するための[QueryScopedValueRef]の拡張メソッドを作成します。
extension QueryScopedValueRefMasamuneFormPageScopedValueRefExtensions
    on QueryScopedValueRef<AppScopedValueOrAppRef> {
  /// [FormController] is obtained by passing [FormControllerQueryBase] for the form generated by the builder.
  ///
  /// The state is always saved in page scope.
  ///
  /// ビルダーによりコード生成されたフォーム用の[FormControllerQueryBase]を渡すことにより状態を保持された[FormController]を取得します。
  ///
  /// かならずページスコープで状態が保存されます。
  ///
  /// ```dart
  /// final userController = ref.page.form(UserFormController.query()); // Get the user form controller.
  /// ```
  FormController<TModel> form<TModel>(
    FormControllerQueryBase<TModel> query,
  ) {
    return this.query(query);
  }
}

/// Extension methods for [ControllerQueryBase<FormController>].
///
/// [ControllerQueryBase<FormController>]の拡張メソッドです。
extension FormControllerQueryBaseExtensions<TModel>
    on FormControllerQueryBase<TModel> {
  /// Get [FormController<TModel>] while monitoring it with the widget associated with [ref] in the same way as `ref.page.controller`.
  ///
  /// `ref.page.controller`と同じように[ref]に関連するウィジェットで監視を行いつつ[FormController<TModel>]を取得します。
  FormController<TModel> watch(RefHasApp ref) {
    return ref.app.form(this);
  }
}

/// Base class for creating state-to-state usage queries for [FormController] that are code-generated by the builder.
///
/// Basically, you can get a class that inherits from [ChangeNotifier].
///
/// ビルダーによりコード生成する[FormController]の状態間利用クエリを作成するためのベースクラス。
///
/// 基本的には[ChangeNotifier]を継承したクラスを取得することが出来ます。
abstract class FormControllerQueryBase<TModel>
    extends ChangeNotifierScopedQueryBase<FormController<TModel>,
        AppScopedValueOrAppRef> {
  /// Base class for creating state-to-state usage queries for [FormController] that are code-generated by the builder.
  ///
  /// Basically, you can get a class that inherits from [ChangeNotifier].
  ///
  /// ビルダーによりコード生成する[FormController]の状態間利用クエリを作成するためのベースクラス。
  ///
  /// 基本的には[ChangeNotifier]を継承したクラスを取得することが出来ます。
  const FormControllerQueryBase()
      : super(
          _provider,
        );

  static TController _provider<TController extends Listenable>(Ref ref) {
    throw UnimplementedError();
  }

  @override
  bool get autoDisposeWhenUnreferenced => true;
}
