part of katana_form;

/// Form to select from there with [Map] as an option.
///
/// Place under the [Form] that gave [FormController.key], or pass [FormController] to [form].
///
/// When [FormController] is passed to [form], [onSaved] must be passed together with [form]. The contents of [onSaved] will be used to save the data.
///
/// Enter the initial value given by [FormController.value] in [initialValue].
///
/// Each time the content is changed, [onChanged] is executed.
///
/// If [FormController.validateAndSave] is executed, validation and data saving are performed.
///
/// Only when [emptyErrorText] is specified, [emptyErrorText] will be displayed as an error if no characters are entered.
///
/// Other error checking is performed by specifying [validator].
/// If a string other than [Null] is returned in the callback, the string is displayed as an error statement. If [Null] is returned, it is processed as no error.
///
/// The [onSubmitted] process is executed when the Enter key or other keys are pressed.
///
/// By specifying [picker], it is possible to set the selection method for [Map].
///
/// If [enabled] is `false`, the text is deactivated.
///
/// If [readOnly] is set to `true`, the activation is displayed, but the text cannot be changed.
///
/// [Map]を選択肢としてそこから選択するためのフォーム。
///
/// [FormController.key]を与えた[Form]配下に配置、もしくは[form]に[FormController]を渡します。
///
/// [form]に[FormController]を渡した場合、[form]を渡した場合一緒に[onSaved]も渡してください。データの保存は[onSaved]の内容が実行されます。
///
/// [initialValue]に[FormController.value]から与えられた初期値を入力します。
///
/// 内容が変更される度[onChanged]が実行されます。
///
/// [FormController.validateAndSave]が実行された場合、バリデーションとデータの保存を行ないます。
///
/// [emptyErrorText]が指定されている時に限り、文字が入力されていない場合[emptyErrorText]がエラーとして表示されます。
///
/// それ以外のエラーチェックは[validator]を指定することで行ないます。
/// コールバック内で[Null]以外を返すようにするとその文字列がエラー文として表示されます。[Null]の場合はエラーなしとして処理されます。
///
/// Enterキーなどが押された場合の処理を[onSubmitted]が実行されます。
///
/// [picker]を指定することで[Map]の選択方法を設定することが可能です。
///
/// [enabled]が`false`になるとテキストが非有効化されます。
///
/// [readOnly]が`true`になっている場合は、有効化の表示になりますが、テキストが変更できなくなります。
class FormMapField<TValue> extends StatefulWidget {
  /// Form to select from there with [Map] as an option.
  ///
  /// Place under the [Form] that gave [FormController.key], or pass [FormController] to [form].
  ///
  /// When [FormController] is passed to [form], [onSaved] must be passed together with [form]. The contents of [onSaved] will be used to save the data.
  ///
  /// Enter the initial value given by [FormController.value] in [initialValue].
  ///
  /// Each time the content is changed, [onChanged] is executed.
  ///
  /// If [FormController.validateAndSave] is executed, validation and data saving are performed.
  ///
  /// Only when [emptyErrorText] is specified, [emptyErrorText] will be displayed as an error if no characters are entered.
  ///
  /// Other error checking is performed by specifying [validator].
  /// If a string other than [Null] is returned in the callback, the string is displayed as an error statement. If [Null] is returned, it is processed as no error.
  ///
  /// The [onSubmitted] process is executed when the Enter key or other keys are pressed.
  ///
  /// By specifying [picker], it is possible to set the selection method for [Map].
  ///
  /// If [enabled] is `false`, the text is deactivated.
  ///
  /// If [readOnly] is set to `true`, the activation is displayed, but the text cannot be changed.
  ///
  /// [Map]を選択肢としてそこから選択するためのフォーム。
  ///
  /// [FormController.key]を与えた[Form]配下に配置、もしくは[form]に[FormController]を渡します。
  ///
  /// [form]に[FormController]を渡した場合、[form]を渡した場合一緒に[onSaved]も渡してください。データの保存は[onSaved]の内容が実行されます。
  ///
  /// [initialValue]に[FormController.value]から与えられた初期値を入力します。
  ///
  /// 内容が変更される度[onChanged]が実行されます。
  ///
  /// [FormController.validateAndSave]が実行された場合、バリデーションとデータの保存を行ないます。
  ///
  /// [emptyErrorText]が指定されている時に限り、文字が入力されていない場合[emptyErrorText]がエラーとして表示されます。
  ///
  /// それ以外のエラーチェックは[validator]を指定することで行ないます。
  /// コールバック内で[Null]以外を返すようにするとその文字列がエラー文として表示されます。[Null]の場合はエラーなしとして処理されます。
  ///
  /// Enterキーなどが押された場合の処理を[onSubmitted]が実行されます。
  ///
  /// [picker]を指定することで[Map]の選択方法を設定することが可能です。
  ///
  /// [enabled]が`false`になるとテキストが非有効化されます。
  ///
  /// [readOnly]が`true`になっている場合は、有効化の表示になりますが、テキストが変更できなくなります。
  const FormMapField({
    this.form,
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.style,
    this.enabled = true,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.initialValue,
    required this.picker,
    this.onSaved,
    this.focusNode,
    this.emptyErrorText,
    this.onSubmitted,
  }) : assert(
          (form == null && onSaved == null) ||
              (form != null && onSaved != null),
          "Both are required when using [context] or [onSaved].",
        );

  /// Context for forms.
  ///
  /// The widget is created outside of the widget in advance and handed over to the client.
  ///
  /// フォーム用のコンテキスト。
  ///
  /// 予めウィジェット外で作成し渡します。
  final FormController<TValue>? form;

  /// Form Style.
  ///
  /// フォームのスタイル。
  final FormStyle? style;

  /// Controller for text forms.
  ///
  /// テキストフォーム用のコントローラー。
  final TextEditingController? controller;

  /// Specifies the focus node.
  ///
  /// The focus node makes it possible to control the focus of the form.
  ///
  /// フォーカスノードを指定します。
  ///
  /// フォーカスノードを利用してフォームのフォーカスをコントロールすることが可能になります。
  final FocusNode? focusNode;

  /// Initial value.
  ///
  /// 初期値。
  final String? initialValue;

  /// Hint to be displayed on the form. Displayed when no text is entered.
  ///
  /// フォームに表示するヒント。文字が入力されていない場合表示されます。
  final String? hintText;

  /// Label text for forms.
  ///
  /// フォーム用のラベルテキスト。
  final String? labelText;

  /// Error text. Only displayed if no characters are entered.
  ///
  /// エラーテキスト。入力された文字がない場合のみ表示されます。
  final String? emptyErrorText;

  /// If this is `false`, it is deactivated.
  ///
  /// In addition to disabling input, the form design, etc., will also be changed to a deactivated version.
  ///
  /// これが`false`の場合、非有効化されます。
  ///
  /// 入力ができなくなる他、フォームのデザイン等も非有効化されたものに変更されます。
  final bool enabled;

  /// If this is `true`, the form cannot be filled out and changed from its initial value.
  ///
  /// これが`true`の場合、フォームの入力が行えずに初期値から変更することができなくなります。
  final bool readOnly;

  /// Callback executed when [FormController.validateAndSave] is executed.
  ///
  /// The current value is passed to `value`.
  ///
  /// [FormController.validateAndSave]が実行されたときに実行されるコールバック。
  ///
  /// `value`に現在の値が渡されます。
  final TValue Function(String value)? onSaved;

  /// Callback to be executed each time the value is changed.
  ///
  /// The current value is passed to `value`.
  ///
  /// 値が変更されるたびに実行されるコールバック。
  ///
  /// `value`に現在の値が渡されます。
  final void Function(String? value)? onChanged;

  /// Validator to be executed when [FormController.validateAndSave] is executed.
  ///
  /// It is executed before [onSaved] is called.
  ///
  /// The current value is passed to `value` and if it returns a value other than [Null], the character is displayed as error text.
  ///
  /// If a character other than [Null] is returned, [onSaved] will not be executed and [FormController.validateAndSave] will return `false`.
  ///
  /// [FormController.validateAndSave]が実行されたときに実行されるバリデーター。
  ///
  /// [onSaved]が呼ばれる前に実行されます。
  ///
  /// `value`に現在の値が渡され、[Null]以外の値を返すとその文字がエラーテキストとして表示されます。
  ///
  /// [Null]以外の文字を返した場合、[onSaved]は実行されず、[FormController.validateAndSave]が`false`が返されます。
  final FormFieldValidator<String?>? validator;

  /// It is executed when the Enter button on the keyboard or the Submit button on the software keyboard is pressed.
  ///
  /// The current value is passed to `value`.
  ///
  /// キーボードのEnterボタン、もしくはソフトウェアキーボードのサブミットボタンが押された場合に実行されます。
  ///
  /// `value`に現在の値が渡されます。
  final void Function(String? value)? onSubmitted;

  /// Picker object for selecting from [Map].
  ///
  /// [Map]からを選択するためのピッカーオブジェクト。
  final FormMapFieldPicker picker;

  @override
  State<StatefulWidget> createState() => _FormMapFieldState<TValue>();
}

class _FormMapFieldState<TValue> extends State<FormMapField<TValue>> {
  TextEditingController? _controller;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      return;
    }
    if (widget.initialValue != null) {
      widget.controller?.text = widget.initialValue!.toString();
    }
    _controller = TextEditingController(text: widget.controller?.text);
    _controller?.addListener(_listenerInside);
    widget.controller?.addListener(_listenerOutside);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.removeListener(_listenerInside);
    widget.controller?.removeListener(_listenerOutside);
  }

  void _listenerOutside() {
    if (_controller?.text == widget.controller?.text) {
      return;
    }
    _controller?.text = widget.controller?.text ?? "";
  }

  void _listenerInside() {
    if (_controller?.text == widget.controller?.text) {
      return;
    }
    widget.controller?.text = _controller?.text ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final mainTextStyle = widget.style?.textStyle?.copyWith(
          color: widget.style?.color,
        ) ??
        TextStyle(
          color: widget.style?.color ??
              Theme.of(context).textTheme.subtitle1?.color ??
              Theme.of(context).colorScheme.onBackground,
        );
    final subTextStyle = widget.style?.textStyle?.copyWith(
          color: widget.style?.subColor,
        ) ??
        TextStyle(
          color: widget.style?.subColor ??
              widget.style?.color?.withOpacity(0.5) ??
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(0.5) ??
              Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        );
    final errorTextStyle = widget.style?.textStyle?.copyWith(
          color: widget.style?.errorColor,
        ) ??
        TextStyle(
          color:
              widget.style?.errorColor ?? Theme.of(context).colorScheme.error,
        );
    const borderSide = OutlineInputBorder(
      borderSide: BorderSide.none,
    );

    return Padding(
      padding:
          widget.style?.padding ?? const EdgeInsets.symmetric(vertical: 16),
      child: _MapTextField<TValue>(
        controller: _controller,
        form: widget.form,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.text,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        decoration: InputDecoration(
          contentPadding: widget.style?.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          fillColor: widget.style?.backgroundColor,
          filled: widget.style?.backgroundColor != null,
          isDense: true,
          border: widget.style?.border ?? borderSide,
          enabledBorder: widget.style?.border ?? borderSide,
          disabledBorder: widget.style?.disabledBorder ??
              widget.style?.border ??
              borderSide,
          errorBorder:
              widget.style?.errorBorder ?? widget.style?.border ?? borderSide,
          focusedBorder: widget.style?.border ?? borderSide,
          focusedErrorBorder:
              widget.style?.errorBorder ?? widget.style?.border ?? borderSide,
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefix: widget.style?.prefix?.child,
          suffix: widget.style?.suffix?.child,
          prefixIcon: widget.style?.prefix?.icon,
          suffixIcon: widget.style?.suffix?.icon,
          prefixText: widget.style?.prefix?.label,
          suffixText: widget.style?.suffix?.label,
          prefixIconColor: widget.style?.prefix?.iconColor,
          suffixIconColor: widget.style?.suffix?.iconColor,
          prefixIconConstraints: widget.style?.prefix?.iconConstraints,
          suffixIconConstraints: widget.style?.suffix?.iconConstraints,
          labelStyle: mainTextStyle,
          hintStyle: subTextStyle,
          suffixStyle: subTextStyle,
          prefixStyle: subTextStyle,
          counterStyle: subTextStyle,
          helperStyle: subTextStyle,
          errorStyle: errorTextStyle,
        ),
        style: mainTextStyle,
        textAlign: widget.style?.textAlign ?? TextAlign.left,
        textAlignVertical: widget.style?.textAlignVertical,
        readOnly: widget.readOnly,
        validator: (value) {
          if (widget.emptyErrorText.isNotEmpty && value == null) {
            return widget.emptyErrorText;
          }
          return widget.validator?.call(value);
        },
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        onSaved: (value) {
          if (value == null) {
            return;
          }
          final res = widget.onSaved?.call(value);
          if (res == null) {
            return;
          }
          widget.form!.value = res;
        },
        picker: widget.picker,
      ),
    );
  }
}

class _MapTextField<TValue> extends FormField<String> {
  _MapTextField({
    required this.picker,
    Key? key,
    this.form,
    FormFieldSetter<String?>? onSaved,
    FormFieldValidator<String?>? validator,
    String? initialValue,
    bool enabled = true,
    this.onChanged,
    this.controller,
    this.focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    this.readOnly = true,
    bool? showCursor,
    bool obscureText = false,
    bool autocorrect = true,
    bool expands = false,
    VoidCallback? onEditingComplete,
    ValueChanged<String?>? onSubmitted,
    List<TextInputFormatter>? inputFormatters,
    double cursorWidth = 2.0,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
  }) : super(
          key: key,
          initialValue: initialValue,
          enabled: enabled,
          validator: validator,
          onSaved: onSaved,
          builder: (field) {
            final _SelectTextFieldState<TValue> state =
                field as _SelectTextFieldState<TValue>;
            final InputDecoration effectiveDecoration = decoration
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            return TextField(
              mouseCursor: SystemMouseCursors.click,
              controller: state._effectiveController ??
                  TextEditingController(
                    text: state.value != null ? state.value!.toString() : null,
                  ),
              focusNode: state._effectiveFocusNode,
              decoration: effectiveDecoration.copyWith(
                errorText: field.errorText,
              ),
              keyboardType: keyboardType,
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              textInputAction: textInputAction,
              style: style,
              strutStyle: strutStyle,
              textCapitalization: textCapitalization,
              autofocus: autofocus,
              readOnly: true,
              showCursor: showCursor,
              obscureText: obscureText,
              autocorrect: autocorrect,
              expands: expands,
              onChanged: (text) => field.didChange(state.parse(text)),
              onEditingComplete: onEditingComplete,
              onSubmitted: (text) => onSubmitted?.call(state.parse(text)),
              inputFormatters: inputFormatters,
              enabled: enabled,
              cursorWidth: cursorWidth,
              cursorRadius: cursorRadius,
              cursorColor: cursorColor,
              scrollPadding: scrollPadding,
              keyboardAppearance: keyboardAppearance,
              enableInteractiveSelection: enableInteractiveSelection,
              buildCounter: buildCounter,
            );
          },
        );

  final FormController<TValue>? form;
  final FormMapFieldPicker picker;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final void Function(String? value)? onChanged;

  @override
  _SelectTextFieldState<TValue> createState() =>
      _SelectTextFieldState<TValue>();
}

class _SelectTextFieldState<TValue> extends FormFieldState<String> {
  TextEditingController? _controller;
  FocusNode? _focusNode;
  bool isShowingDialog = false;
  bool hadFocus = false;

  @override
  _MapTextField<TValue> get widget => super.widget as _MapTextField<TValue>;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _controller;
  FocusNode? get _effectiveFocusNode => widget.focusNode ?? _focusNode;

  bool get hasFocus => _effectiveFocusNode?.hasFocus ?? false;
  bool get hasText => _effectiveController?.text.isNotEmpty ?? false;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: format(widget.initialValue));
      _controller?.addListener(_handleControllerChanged);
    }
    if (value == null) {
      setValue(parse(_effectiveController?.text ?? "") ?? widget.initialValue);
    }
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
      _focusNode?.addListener(_handleFocusChanged);
    }
    widget.form?.register(this);
    widget.controller?.addListener(_handleControllerChanged);
    widget.focusNode?.addListener(_handleFocusChanged);
  }

  @override
  void didUpdateWidget(_MapTextField<TValue> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller?.value);
        _controller?.addListener(_handleControllerChanged);
      }
      if (widget.controller != null) {
        setValue(parse(widget.controller?.text ?? ""));
        if (oldWidget.controller == null) {
          _controller?.dispose();
          _controller = null;
        }
      }
    }
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.removeListener(_handleFocusChanged);
      widget.focusNode?.addListener(_handleFocusChanged);

      if (oldWidget.focusNode != null && widget.focusNode == null) {
        _focusNode = FocusNode();
        _focusNode?.addListener(_handleFocusChanged);
      }
      if (widget.focusNode != null && oldWidget.focusNode == null) {
        // Release the focus node since it wont be used
        _focusNode?.dispose();
        _focusNode = null;
      }
    }
  }

  @override
  void didChange(String? value) {
    widget.onChanged?.call(value);
    super.didChange(value);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    widget.controller?.removeListener(_handleControllerChanged);
    widget.focusNode?.removeListener(_handleFocusChanged);
    widget.form?.unregister(this);
    super.dispose();
  }

  @override
  void reset() {
    super.reset();
    _effectiveController?.text = format(widget.initialValue) ?? "";
    didChange(widget.initialValue);
  }

  void _handleControllerChanged() {
    if (_effectiveController?.text != format(value))
      didChange(parse(_effectiveController?.text));
  }

  String? format(String? value) => value?.toString();
  String? parse(String? text) {
    return text;
  }

  Future<void> requestUpdate() async {
    if (widget.readOnly) {
      return;
    }
    if (!isShowingDialog) {
      isShowingDialog = true;
      final newValue = await widget.picker.build(context, value);
      isShowingDialog = false;
      if (newValue != null) {
        _effectiveController?.text = format(newValue) ?? "";
      }
    }
  }

  void _handleFocusChanged() {
    if (hasFocus && !hadFocus) {
      hadFocus = hasFocus;
      _hideKeyboard();
      requestUpdate();
    } else {
      hadFocus = hasFocus;
    }
  }

  void _hideKeyboard() {
    Future.microtask(() => FocusScope.of(context).requestFocus(FocusNode()));
  }

  Future<void> clear() async {
    if (widget.readOnly) {
      return;
    }
    _hideKeyboard();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      setState(() => _effectiveController?.clear());
    });
  }
}

/// Class that defines the picker style for selection from [Map].
///
/// Pass `Map<String, String>` to [data].
/// Key in [Map] is the ID for selection and Value is the display label for selection.
///
/// If [defaultKey] is not in the key of [data], an error will occur.
///
/// [Map]から選択するためのピッカースタイルを定義するクラス。
///
/// `Map<String, String>`を[data]に渡します。
/// [Map]のKeyが選択用のID、Valueが選択用の表示ラベルになります。
///
/// [defaultKey]が[data]のキーにない場合エラーになります。
class FormMapFieldPicker {
  /// Class that defines the picker style for selection from [Map].
  ///
  /// Pass `Map<String, String>` to [data].
  /// Key in [Map] is the ID for selection and Value is the display label for selection.
  ///
  /// If [defaultKey] is not in the key of [data], an error will occur.
  ///
  /// [Map]から選択するためのピッカースタイルを定義するクラス。
  ///
  /// `Map<String, String>`を[data]に渡します。
  /// [Map]のKeyが選択用のID、Valueが選択用の表示ラベルになります。
  ///
  /// [defaultKey]が[data]のキーにない場合エラーになります。
  FormMapFieldPicker({
    required this.defaultKey,
    required this.data,
    this.backgroundColor,
    this.color,
    this.confirmText = "Confirm",
    this.cancelText = "Cancel",
  }) : assert(
          data.containsKey(defaultKey),
          "[defaultId] is not included in [data].",
        );

  /// Specifies the key if not selected.
  ///
  /// 選択されていない場合のキーを指定します。
  final String defaultKey;

  /// Data for options.
  ///
  /// Key in [Map] is the ID for selection and Value is the display label for selection.
  ///
  /// 選択肢用のデータ。
  ///
  /// [Map]のKeyが選択用のID、Valueが選択用の表示ラベルになります。
  final Map<String, String> data;

  /// Background color of the picker.
  ///
  /// ピッカーの背景色。
  final Color? backgroundColor;

  /// Foreground view of the picker.
  ///
  /// ピッカーの前景色。
  final Color? color;

  /// Text of the button that confirms the picker's content.
  ///
  /// ピッカーの内容を確定するボタンのテキスト。
  final String confirmText;

  /// Text of the button to cancel the picker.
  ///
  /// ピッカーをキャンセルするボタンのテキスト。
  final String cancelText;

  /// Build the picker.
  ///
  /// [context] is passed [BuildContext]. [currentKey] is passed the currently selected key.
  ///
  /// ピッカーのビルドを行ないます。
  ///
  /// [context]に[BuildContext]が渡されます。[currentKey]に現在選択されているキーが渡されます。
  Future<String?> build(BuildContext context, String? currentKey) async {
    String? res;
    final keys = data.keys.toList();
    await Picker(
      height: 240,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      containerColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      headerColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      textStyle:
          TextStyle(color: color ?? Theme.of(context).colorScheme.onSurface),
      confirmText: confirmText,
      cancelText: cancelText,
      selecteds: [
        keys.indexOf(currentKey ?? defaultKey),
      ],
      adapter: PickerDataAdapter<String>(
        data: [
          ...keys.map((key) {
            return PickerItem<String>(
              text: Text(
                data[key] ?? "",
                style: TextStyle(
                  color: color ?? Theme.of(context).colorScheme.onSurface,
                ),
              ),
              value: key,
            );
          })
        ],
      ),
      changeToFirst: true,
      hideHeader: false,
      onConfirm: (Picker picker, List<int> value) {
        res = keys[value[0]];
      },
    ).showModal(context);
    return res;
  }
}
