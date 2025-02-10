// Project imports:
import 'package:katana_cli/katana_cli.dart';

/// Contents of widget_ui_impl.mdc.
///
/// widget_ui_impl.mdcの中身。
class WidgetUiImplMdcCliAiCode extends CliAiCode {
  /// Contents of widget_ui_impl.mdc.
  ///
  /// widget_ui_impl.mdcの中身。
  const WidgetUiImplMdcCliAiCode();

  @override
  String get name => "`Widget`のUI実装";

  @override
  String get globs => "lib/widgets/**/*.dart, lib/models/**/*.dart";

  @override
  String get directory => "impls";

  @override
  String get description => "`Widget設計書`を用いた`Widget`のUI実装方法";

  @override
  String body(String baseName, String className) {
    return r"""
[widget_design.md](mdc:documents/designs/widget_design.md)に記載されている`Widget設計書`と`lib/widgets`に作成されているDartファイルを参照して`Widget`のUIを実装
[widget_design.md](mdc:documents/designs/widget_design.md)が存在しない場合は絶対に実施しない

## `stateless`

1. 対象のDartファイル（`lib/widgets`以下に[WidgetName(SnakeCase&末尾のWidgetを取り除く)].dart）を開く
2. `Widget設計書`の`Content`に応じて`build`メソッド内の`// TODO: Implement the view.`以下を書き換え、適切なUIを構築して返す。
    - 適宜`import`を追加する
    - クラスに定義されている変数や`build`メソッド内で定義されている変数を利用する
    - 下記の`Widget`を優先的に利用する
        - [`KatanaUI`の`Widget`](mdc:.cursor/rules/docs/katana_ui_usage.mdc)
        - [`Flutter`の`Widget`](mdc:.cursor/rules/docs/flutter_widgets.mdc)
        - [`Form`の`Widget`](mdc:.cursor/rules/docs/form_usage.mdc)
    - `Router`を用いて別画面への遷移を行う。詳しくは[`Router`の利用方法](mdc:.cursor/rules/docs/router_usage.mdc)を参照
    - 例：
        ```dart
        // TODO: Implement the view.
        return Container(
          child: Text('Hello, World!'),
        );
        ```

## `stateful`

1. 対象のDartファイル（`lib/widgets`以下に[WidgetName(SnakeCase&末尾のWidgetを取り除く)].dart）を開く
2. `Widget設計書`の`Content`に応じて`build`メソッド内の`// TODO: Implement the view.`以下を書き換え、適切なUIを構築して返す。
    - 適宜`import`を追加する
    - クラスに定義されている変数や`build`メソッド内で定義されている変数を利用する
    - 下記の`Widget`を優先的に利用する
        - [`KatanaUI`の`Widget`](mdc:.cursor/rules/docs/katana_ui_usage.mdc)
        - [`Flutter`の`Widget`](mdc:.cursor/rules/docs/flutter_widgets.mdc)
        - [`Form`の`Widget`](mdc:.cursor/rules/docs/form_usage.mdc)
    - `Router`を用いて別画面への遷移を行う。詳しくは[`Router`の利用方法](mdc:.cursor/rules/docs/router_usage.mdc)を参照
    - 例：
        ```dart
        // TODO: Implement the view.
        return Container(
          child: Text('Hello, World!'),
        );
        ```

## `model_extension`

1. `TargetModel`に対応する`lib/models/[TargetModelのModelName(SnakeCase&末尾のModelを取り除く)].dart`以下のファイルを開く。
2. `Widget設計書`の`Content`に応じて該当する`toXXX`メソッド内を書き換え、適切なUIを構築して返す。
    - 適宜`import`を追加する
    - `Model`の`Document`の変数をそのまま利用してもよい
        - `value`で`Model`の変数をそのまま利用可能
        - `uid`で`Model`の`DocumentID`を利用可能
    - 下記の`Widget`を優先的に利用する
        - [`KatanaUI`の`Widget`](mdc:.cursor/rules/docs/katana_ui_usage.mdc)
        - [`Flutter`の`Widget`](mdc:.cursor/rules/docs/flutter_widgets.mdc)
        - [`Form`の`Widget`](mdc:.cursor/rules/docs/form_usage.mdc)
    - `Router`を用いて別画面への遷移を行う。詳しくは[`Router`の利用方法](mdc:.cursor/rules/docs/router_usage.mdc)を参照
    - 例：
        ```dart
        // TODO: Implement the view.
        return Container(
          child: Text(this.value?.title ?? ''),
        );
        ```
""";
  }
}
