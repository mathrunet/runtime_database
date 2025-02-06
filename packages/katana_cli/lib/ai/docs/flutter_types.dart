import 'package:katana_cli/katana_cli.dart';

/// Contents of flutter_types.mdc.
///
/// flutter_types.mdcの中身。
class FlutterTypesMdcCliAiCode extends CliAiCode {
  /// Contents of flutter_types.mdc.
  ///
  /// flutter_types.mdcの中身。
  const FlutterTypesMdcCliAiCode();

  @override
  String get name => "Flutter特有の型の一覧";

  @override
  String get description => "Flutter特有の型の一覧";

  @override
  String get globs => "*.dart";

  @override
  String get directory => "docs";

  @override
  String body(String baseName, String className) {
    return r"""
Flutterにおいて様々な場所で利用可能なタイプであるFlutter特有の型の一覧を下記に記載する。

## 利用可能な場所一覧

- `Page`や`Widget`、`Controller`等のコンストラクタパラメーター
- `Page`や`Widget`、`Controller`等のフィールド
- 各関数やメソッドの引数と戻り値
- 処理内の変数

※`Model`の`DataField`におけるタイプには利用不可。

## Flutter特有の型の一覧

| タイプ | 概要 |
| --- | --- |
| `Widget` | FlutterのWidgetを継承したクラスすべて。Masamuneフレームワークにおける`Widget`や`Page`も含む。 |
| `Future<[タイプ]>` | 非同期処理の結果を返す。 |
| `FutureOr<[タイプ]>` | 非同期処理の結果を返す。 |
| `VoidCallback` | 引数がなく戻り値がない関数。 |
| `ValueChanged<[タイプ]>` | 値が変更された際に呼び出される関数。 |
""";
  }
}
