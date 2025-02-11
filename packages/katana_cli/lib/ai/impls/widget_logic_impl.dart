// Project imports:
import 'package:katana_cli/katana_cli.dart';

/// Contents of widget_logic_impl.mdc.
///
/// widget_logic_impl.mdcの中身。
class WidgetLogicImplMdcCliAiCode extends CliAiCode {
  /// Contents of widget_logic_impl.mdc.
  ///
  /// widget_logic_impl.mdcの中身。
  const WidgetLogicImplMdcCliAiCode();

  @override
  String get name => "`Widget`のロジック実装";

  @override
  String get globs => "lib/**/*.dart";

  @override
  String get directory => "impls";

  @override
  String get description => "`Widget設計書`を用いた`Widget`のロジック実装方法";

  @override
  String body(String baseName, String className) {
    return r"""
[widget_design.md](mdc:documents/designs/widget_design.md)に記載されている`Widget設計書`と`lib/widgets`に作成されているDartファイルを参照して`Widget`のロジックを実装
[widget_design.md](mdc:documents/designs/widget_design.md)が存在しない場合は絶対に実施しない

`Widget設計書`に記載されている各`Widget`の`WidgetType`に応じてそれぞれ下記を実行

## `stateless`

実施しない

## `stateful`

1. 対象のDartファイル（`lib/widgets`以下に[WidgetName(SnakeCase&末尾のWidgetを取り除く)].dart）を開く
2. `Widget設計書`の`Content`に応じて`build`メソッド内の`// TODO: Implement the variable loading process.`以下に`ref`を用いてプロジェクト内の各種`Model`や`Controller`を取得する。
    - 適宜`import`を追加する
    - `Model`や`Controller`の取得方法は下記を参照。
        - [`Model`や`Controller`の取得方法](mdc:.cursor/rules/docs/state_management_usage.mdc)
        - [`Model`の利用方法](mdc:.cursor/rules/docs/model_usage.mdc)
    - 例：
        ```dart
        // TODO: Implement the variable loading process.
        final memoController = ref.app.controller(MemoController.query());
        final memoCollection = ref.app.model(MemoModel.collection())..load();
        final memoState = ref.page.watch((_) => ValueNotifier<bool>(false));
        ```

## `model_extension`

実施しない
""";
  }
}
