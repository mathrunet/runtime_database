part of masamune_ui.variable;

mixin VariableFormConfigUtilMixin<T> on VariableFormConfig<T> {
  Widget? headlinePrefix({
    required BuildContext context,
    required VariableConfig<T> config,
    Color? color,
  }) {
    if (config.icon != null) {
      return IconTheme(
        data: const IconThemeData(size: 16),
        child: Icon(
          config.icon!,
          color: color?.withOpacity(0.75),
        ),
      );
    }
    if (config.required) {
      return IconTheme(
        data: const IconThemeData(size: 16),
        child: context.theme.widget.requiredIcon,
      );
    }
    return null;
  }
}
