part of katana_router;

class _AppRouterDelegate extends RouterDelegate<PageQuery> with ChangeNotifier {
  _AppRouterDelegate({
    required this.router,
    this.observers = const [],
    this.restorationScopeId,
  });

  final AppRouter router;
  final String? restorationScopeId;
  final List<NavigatorObserver> observers;

  @override
  Widget build(BuildContext context) {
    if (router._pageStack.isEmpty) {
      return const SizedBox.shrink();
    }
    return AppRouteScope(
      router: router,
      child: Navigator(
        pages: router._pageStack.map((e) => e.route).toList(),
        observers: observers,
        restorationScopeId: restorationScopeId,
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          pop();
          return true;
        },
      ),
    );
  }

  Future<E?> push<E>(
    PageQuery pageQuery, [
    RouteQuery? routeQuery,
  ]) =>
      router.push<E>(pageQuery, routeQuery);

  Future<E?> replace<E>(
    PageQuery pageQuery, [
    RouteQuery? routeQuery,
  ]) =>
      router.replace<E>(pageQuery, routeQuery);

  bool canPop() => router.canPop();

  void pop<E>([E? result]) => router.pop<E>(result);

  @override
  Future<bool> popRoute() {
    if (!canPop()) {
      SystemNavigator.pop();
      return SynchronousFuture(false);
    }
    pop();
    return SynchronousFuture(true);
  }

  @override
  Future<void> setNewRoutePath(PageQuery configuration) {
    return push<void>(configuration);
  }

  @override
  Future<void> setInitialRoutePath(PageQuery configuration) async {
    final boot = router._config.boot;
    if (boot != null) {
      await push<void>(boot.resolve(configuration.path));
      return push<void>(configuration, boot.initialRouteQuery);
    }
    return super.setInitialRoutePath(configuration);
  }
}
