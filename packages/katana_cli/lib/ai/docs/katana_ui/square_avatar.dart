import 'package:katana_cli/ai/docs/katana_ui_usage.dart';

/// Contents of square_avatar.mdc.
///
/// square_avatar.mdcの中身。
class KatanaUISquareAvatarMdcCliAiCode extends KatanaUiUsageCliAiCode {
  /// Contents of square_avatar.mdc.
  ///
  /// square_avatar.mdcの中身。
  const KatanaUISquareAvatarMdcCliAiCode();

  @override
  String get name => "SquareAvatarの利用方法";

  @override
  String get description => "MasamuneフレームワークにおけるSquareAvatarの利用方法";

  @override
  String get globs => "lib/**/*.dart, test/**/*.dart";

  @override
  String get directory => "docs/katana_ui";

  @override
  String get excerpt => "四角形のアバター表示用ウィジェット。CircleAvatarの四角版として使用可能。";

  @override
  String body(String baseName, String className) {
    return r"""
# SquareAvatar

## 概要

四角形のアバター表示用ウィジェット。`CircleAvatar`の四角版として使用可能で、画像やカラーを背景として設定できます。

## 特徴

- 四角形のアバター表示
- 角丸の調整が可能
- 背景色の設定が可能
- 背景画像の設定が可能
- 画像は`BoxFit.cover`でフィットされる

## 基本的な使い方

### 背景色を設定する場合

```dart
SquareAvatar(
  backgroundColor: Colors.blue,
  radius: 8.0, // 角丸の設定
);
```

### 背景画像を設定する場合

```dart
SquareAvatar(
  backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
  radius: 12.0,
);
```

### 背景色と背景画像を組み合わせる場合

```dart
SquareAvatar(
  backgroundColor: Colors.grey, // フォールバック用の背景色
  backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
  radius: 16.0,
);
```

## カスタマイズ例

### 完全な四角形（角丸なし）

```dart
const SquareAvatar(
  backgroundColor: Colors.green,
  radius: 0, // 角丸なし
);
```

### 大きな角丸

```dart
const SquareAvatar(
  backgroundColor: Colors.purple,
  radius: 24.0, // 大きな角丸
);
```

## 注意点

- `radius`を指定しない場合、角丸なしの四角形として表示される
- `backgroundColor`と`backgroundImage`の両方を指定した場合、`backgroundImage`が上に表示される
- 背景画像は常に`BoxFit.cover`でフィットされる
- サイズは親ウィジェットによって決定される（`Stack`の`fit: StackFit.expand`を使用）
""";
  }
}
