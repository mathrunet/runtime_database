// Project imports:
import 'package:katana_cli/katana_cli.dart';

/// Contents of technology_stack.mdc.
///
/// technology_stack.mdcの中身。
class TechnologyStackDocsMdcCliAiCode extends CliAiCode {
  /// Contents of technology_stack.mdc.
  ///
  /// technology_stack.mdcの中身。
  const TechnologyStackDocsMdcCliAiCode();

  @override
  String get name => "技術スタック";

  @override
  String get description => "アプリケーション開発で利用する技術スタック";

  @override
  String get globs =>
      "lib/**/*.dart, test/**/*.dart, katana.yaml, documents/designs/**/*.md, firebase/functions/src/**/*.ts, firebase/functions/test/**/*.ts";

  @override
  String get directory => "docs";

  @override
  String body(String baseName, String className) {
    return r"""
## 技術スタック

下記の技術スタックを利用してアプリケーションを開発。

- デザインフレームワーク
    - [Material Design 3](https://m3.material.io/)
- アプリケーション
    - 言語フレームワーク
        - [Dart / Flutter](https://docs.flutter.dev/)
    - メインフレームワークパッケージ
        - [Masamune](https://pub.dev/documentation/masamune/latest/)
    - その他使用パッケージ
        - [freezed](https://pub.dev/packages/freezed)
        - [json_serializable](https://pub.dev/packages/json_serializable)
        - [build_runner](https://pub.dev/packages/build_runner)
- バックエンド
    - データベース
        - [Firestore (NoSQL)](https://firebase.google.com/docs/firestore)
        - [Firebase Data Connect（PostgreSQL）](https://firebase.google.com/docs/data-connect)
    - 認証
        - [Firebase Authentication](https://firebase.google.com/docs/auth)
    - ファイルストレージ
        - [Cloud Storage for Firebase](https://firebase.google.com/docs/storage)
    - ホスティングサービス
        - [Firebase Hosting](https://firebase.google.com/docs/hosting)
    - API
        - [Cloud Functions for Firebase](https://firebase.google.com/docs/functions)
        - [TypeScript / NodeJS](https://www.typescriptlang.org/docs/)
    - スケジューラー
        - [Cloud Functions for Firebase](https://firebase.google.com/docs/functions)
        - [TypeScript / NodeJS](https://www.typescriptlang.org/docs/)
    - PUSH通知
        - [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging)
    - アプリ解析
        - [Firebase Analytics](https://firebase.google.com/docs/analytics)
""";
  }
}
