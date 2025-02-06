part of "code.dart";

/// Create an Enum base.
///
/// Enumのベースを作成します。
class CodeEnumCliCommand extends CliCodeCommand {
  /// Create an Enum base.
  ///
  /// Enumのベースを作成します。
  const CodeEnumCliCommand();

  @override
  String get name => "enum";

  @override
  String get prefix => "enum";

  @override
  String get directory => "lib/enums";

  @override
  String get description =>
      "Create an Enum base in `$directory/(filepath).dart`. Enumのベースを`$directory/(filepath).dart`に作成します。";

  @override
  String? get example => "katana code enum [enum_name]";

  @override
  Future<void> exec(ExecContext context) async {
    final path = context.args.get(2, "");
    if (path.isEmpty) {
      error(
        "[path] is not specified. Please enter [path] according to the following command.\r\nkatana code enum [path]\r\n",
      );
      return;
    }
    label("Create a enum in `$directory/$path.dart`.");
    final parentPath = path.parentPath();
    if (parentPath.isNotEmpty) {
      final parentDir = Directory("$directory/$parentPath");
      if (!parentDir.existsSync()) {
        await parentDir.create(recursive: true);
      }
    }
    await generateDartCode("$directory/$path", path);
  }

  @override
  String import(String path, String baseName, String className) {
    return """
// ignore: unused_import, unnecessary_import
import 'package:flutter/material.dart';
// ignore: unused_import, unnecessary_import
import 'package:masamune/masamune.dart';

// ignore: unused_import, unnecessary_import
import '/main.dart';
""";
  }

  @override
  String header(String path, String baseName, String className) {
    return """
""";
  }

  @override
  String body(String path, String baseName, String className) {
    return """
enum ${className}Enum {
  // TODO: Set the value of Enum.
}
""";
  }
}
