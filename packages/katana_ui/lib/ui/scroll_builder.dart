part of katana_ui;

/// This widget can be placed on top of a [ListView] or [SingleChildScrollView] to easily add a [RefreshIndicator] or [Scrollbar].
///
/// If [showScrollbarWhenPCorWeb] is `true`, a mouse scrollable scrollbar will be displayed only on PC or Web.
///
/// If [onRefresh] is not [null], a [RefreshIndicator] will be placed and Pull to Refresh will be enabled.
///
/// Please pass a [ListView] or [SingleChildScrollView] to [builder].
///
/// An internal [ScrollController] is created and passed to [builder]. If you want to specify your own [ScrollController], pass it to [controller].
///
/// [ListView]や[SingleChildScrollView]の上に配置することで、[RefreshIndicator]や[Scrollbar]を簡単に追加できるようにするためのウィジェットです。
///
/// [showScrollbarWhenPCorWeb]を`true`にすると、PCやWebでのみマウスでドラッグ可能なスクロールバーを表示します。
///
/// [onRefresh]が[null]でない場合、[RefreshIndicator]を配置し、Pull to Refreshを有効にします。
///
/// [builder]で[ListView]や[SingleChildScrollView]を渡してください。
///
/// 内部で[ScrollController]が作られ、それが[builder]に渡されます。自身で[ScrollController]を指定したい場合は[controller]に渡してください。
class ScrollBuilder extends StatefulWidget {
  /// This widget can be placed on top of a [ListView] or [SingleChildScrollView] to easily add a [RefreshIndicator] or [Scrollbar].
  ///
  /// If [showScrollbarWhenPCorWeb] is `true`, a mouse scrollable scrollbar will be displayed only on PC or Web.
  ///
  /// If [onRefresh] is not [null], a [RefreshIndicator] will be placed and Pull to Refresh will be enabled.
  ///
  /// Please pass a [ListView] or [SingleChildScrollView] to [builder].
  ///
  /// An internal [ScrollController] is created and passed to [builder]. If you want to specify your own [ScrollController], pass it to [controller].
  ///
  /// [ListView]や[SingleChildScrollView]の上に配置することで、[RefreshIndicator]や[Scrollbar]を簡単に追加できるようにするためのウィジェットです。
  ///
  /// [showScrollbarWhenPCorWeb]を`true`にすると、PCやWebでのみマウスでドラッグ可能なスクロールバーを表示します。
  ///
  /// [onRefresh]が[null]でない場合、[RefreshIndicator]を配置し、Pull to Refreshを有効にします。
  ///
  /// [builder]で[ListView]や[SingleChildScrollView]を渡してください。
  ///
  /// 内部で[ScrollController]が作られ、それが[builder]に渡されます。自身で[ScrollController]を指定したい場合は[controller]に渡してください。
  const ScrollBuilder({
    super.key,
    this.onRefresh,
    this.controller,
    this.showScrollbarWhenPCorWeb = true,
    required this.builder,
  });

  /// If [onRefresh] is not [null], a [RefreshIndicator] will be placed and Pull to Refresh will be enabled.
  ///
  /// [onRefresh]が[null]でない場合、[RefreshIndicator]を配置し、Pull to Refreshを有効にします。
  final Future<void> Function()? onRefresh;

  /// If [showScrollbarWhenPCorWeb] is `true`, a mouse scrollable scrollbar will be displayed only on PC or Web.
  ///
  /// [showScrollbarWhenPCorWeb]を`true`にすると、PCやWebでのみマウスでドラッグ可能なスクロールバーを表示します。
  final bool showScrollbarWhenPCorWeb;

  /// An internal [ScrollController] is created and passed to [builder]. If you want to specify your own [ScrollController], pass it to [controller].
  ///
  /// 内部で[ScrollController]が作られ、それが[builder]に渡されます。自身で[ScrollController]を指定したい場合は[controller]に渡してください。
  final ScrollController? controller;

  /// Please pass a [ListView] or [SingleChildScrollView] to [builder].
  ///
  /// [builder]で[ListView]や[SingleChildScrollView]を渡してください。
  final Widget Function(BuildContext context, ScrollController controller)
      builder;

  @override
  State<StatefulWidget> createState() => _ScrollBuilderState();
}

class _ScrollBuilderState extends State<ScrollBuilder> {
  late ScrollController _scrollController;

  ScrollController get _effectiveScrollController =>
      widget.controller ?? _scrollController;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _scrollController = ScrollController();
    }
  }

  Widget _buildRefreshIndicator(BuildContext context, Widget child) {
    if (widget.onRefresh != null) {
      return RefreshIndicator(
        onRefresh: widget.onRefresh!,
        child: child,
      );
    } else {
      return child;
    }
  }

  Widget _buildScrollbar(BuildContext context, Widget child) {
    if (widget.showScrollbarWhenPCorWeb &&
        (UniversalPlatform.isDesktop || UniversalPlatform.isWeb)) {
      return Scrollbar(
        interactive: true,
        trackVisibility: true,
        thumbVisibility: true,
        child: child,
      );
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = widget.builder(context, _effectiveScrollController);
    return _buildRefreshIndicator(
      context,
      _buildScrollbar(context, child),
    );
  }
}
