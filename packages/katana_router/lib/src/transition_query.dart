part of katana_router;

/// Route queries for page transitions.
///
/// You can define page transitions by specifying [transition].
///
/// [TransitionQuery.fullscreen], [TransitionQuery.fade], [TransitionQuery.none], [TransitionQuery.bottomModal], [TransitionQuery.fadeModal] and [TransitionQuery.centerModal] to get the [TransitionQuery] that defines each transition as is.
///
/// ページ遷移するためのルートクエリー。
///
/// [transition]を指定することでページのトランジションを定義できます。
///
/// [TransitionQuery.fullscreen]、[TransitionQuery.fade]、[TransitionQuery.none]、[TransitionQuery.centerModal]、[TransitionQuery.bottomModal]、[TransitionQuery.fadeModal]で各トランジションを定義した[TransitionQuery]をそのまま取得できます。
@immutable
class TransitionQuery {
  const TransitionQuery._({
    this.transition = _TransitionQueryType.initial,
  });

  /// Page transitions.
  ///
  /// ページのトランジション。
  // ignore: library_private_types_in_public_api
  final _TransitionQueryType transition;

  /// Create a new [TransitionQuery] with parameters.
  ///
  /// パラメーターを与えて新しい[TransitionQuery]を作成します。
  TransitionQuery copyWith({
    // ignore: library_private_types_in_public_api
    _TransitionQueryType? transition,
  }) {
    return TransitionQuery._(
      transition: transition ?? this.transition,
    );
  }

  /// [TransitionQuery] for full screen transitions.
  ///
  /// フルスクリーンのトランジションを行う[TransitionQuery]。
  static const TransitionQuery fullscreen =
      TransitionQuery._(transition: _TransitionQueryType.fullscreen);

  /// No transitions [TransitionQuery].
  ///
  /// トランジションを行なわない[TransitionQuery]。
  static const TransitionQuery none =
      TransitionQuery._(transition: _TransitionQueryType.none);

  /// [TransitionQuery] to perform fade transitions.
  ///
  /// フェードのトランジションを行なう[TransitionQuery]。
  static const TransitionQuery fade =
      TransitionQuery._(transition: _TransitionQueryType.fade);

  /// [TransitionQuery] that performs a modal transition from the middle.
  ///
  /// The back page will be visible.
  ///
  /// 真ん中からのモーダルのトランジションを行なう[TransitionQuery]。
  ///
  /// 裏のページが見えるようになります。
  static const TransitionQuery centerModal =
      TransitionQuery._(transition: _TransitionQueryType.centerModal);

  /// [TransitionQuery] to perform modal transitions from below.
  ///
  /// The back page will be visible.
  ///
  /// 下からのモーダルのトランジションを行なう[TransitionQuery]。
  ///
  /// 裏のページが見えるようになります。
  static const TransitionQuery bottomModal =
      TransitionQuery._(transition: _TransitionQueryType.bottomModal);

  /// [TransitionQuery] to perform modal transitions from below.
  ///
  /// The back page will be visible.
  ///
  /// The background will also be transparent.
  ///
  /// 下からのモーダルのトランジションを行なう[TransitionQuery]。
  ///
  /// 裏のページが見えるようになります。
  ///
  /// また、背景も透明になります。
  static const TransitionQuery transparentBottomModal = TransitionQuery._(
      transition: _TransitionQueryType.transparentBottomModal);

  /// TransitionQuery] that performs modal transitions that fade.
  ///
  /// The back page will be visible.
  ///
  /// フェードするモーダルのトランジションを行なう[TransitionQuery]。
  ///
  /// 裏のページが見えるようになります。
  static const TransitionQuery fadeModal =
      TransitionQuery._(transition: _TransitionQueryType.fadeModal);

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  int get hashCode => transition.hashCode;

  @override
  String toString() => "$runtimeType($transition)";
}
