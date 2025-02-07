import 'package:katana_cli/katana_cli.dart';

/// Contents of meta_impl.mdc.
///
/// meta_impl.mdcの中身。
class MetadataImplMdcCliAiCode extends CliAiCode {
  /// Contents of meta_impl.mdc.
  ///
  /// meta_impl.mdcの中身。
  const MetadataImplMdcCliAiCode();

  @override
  String get name => "`MetaData`の実装";

  @override
  String get globs => "katana.yaml";

  @override
  String get directory => "impls";

  @override
  String get description => "Masamuneフレームワークによる`MetaData`の実装";

  @override
  String body(String baseName, String className) {
    return r"""
[metadata_design.md](mdc:documents/designs/metadata_design.md)に記載されている`MetaData設計書`から[katana.yaml](mdc:katana.yaml)を編集し`MetaData`を実装

1. `MetaData設計書`で定義されている内容を元に[katana.yaml](mdc:katana.yaml)を編集
    - [katana.yaml](mdc:katana.yaml)の`app->info`を編集
      ```yaml
        # Describe the application information.
        # For each language code, put the normal title in [title] and a short title for the app in [short_title]. Provide an overview of the app in [overview].
        # By increasing the language code, information corresponding to that language can be described.
        # By specifying [domain], you can change the web og tags to those appropriate for that domain.
        # Specify a support email address in the [email] field.
        # Specify the AppStore app ID in [apple_app_id].
        # アプリケーションの情報を記載します。
        # それぞれの言語コードに対して[title]に通常タイトル、[short_title]にアプリ用の短いタイトルを記載します。[overview]にアプリの概要を記載します。
        # 言語コードを増やすことでその言語に対応した情報を記載することができます。
        # [domain]を指定することでWebのogタグをそのドメインに応じたものに変更することができます。
        # [email]にはサポート用のメールアドレスを指定します。
        # [apple_app_id]にはAppStoreのアプリIDを指定します。
        info:
          enable: true # `false`->`true`に変更
          email:
          domain:
          apple_app_id: # e.g. idxxxxxx
          locale:
            ja: # 言語によって記載する内容を変更
              title: [ApplicationTitle]
              short_title: [ShortApplicationTitle]
              overview: [ApplicationOverview]
2. 下記コマンドを実行して変更を適用

  ```bash
  katana apply
  ```
""";
  }
}
