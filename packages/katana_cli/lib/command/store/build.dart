part of katana_cli.store;

/// Build the Android appbundle for the first upload to the store.
///
/// Androidのappbundleをビルドしてストアへの初回アップロードを行います。
class StoreAndroidBuildCliCommand extends CliCommand {
  /// Build the Android appbundle for the first upload to the store.
  ///
  /// Androidのappbundleをビルドしてストアへの初回アップロードを行います。
  const StoreAndroidBuildCliCommand();

  @override
  String get description =>
      "Build the Android appbundle for the first upload to the store. Androidのappbundleをビルドしてストアへの初回アップロードを行います。";

  @override
  Future<void> exec(ExecContext context) async {
    final bin = context.yaml.getAsMap("bin");
    final flutter = bin.get("flutter", "flutter");
    await command(
      "Build for appbunle.",
      [
        flutter,
        "build",
        "appbundle",
        "--release",
        "--dart-define=FLAVOR=prod",
      ],
    );
  }
}
