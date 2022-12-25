part of masamune_builder;

/// Create a class to automatically create a document model.
///
/// ドキュメントモデルを自動作成するためのクラスを作成します。
List<Spec> documentModelClass(
  ClassValue model,
  PathValue path,
) {
  return [
    ...modelClass(model, path),
    Class(
      (c) => c
        ..name = "_\$${model.name}DocumentQuery"
        ..annotations.addAll([const Reference("immutable")])
        ..constructors.addAll([
          Constructor(
            (c) => c..constant = true,
          )
        ])
        ..methods.addAll([
          Method(
            (m) => m
              ..name = "call"
              ..annotations.addAll([const Reference("useResult")])
              ..returns = Reference("_\$_${model.name}DocumentQuery")
              ..body = Code(
                "return _\$_${model.name}DocumentQuery(DocumentModelQuery(\"${path.path}\"));",
              ),
          )
        ]),
    ),
    Class(
      (c) => c
        ..name = "_\$_${model.name}DocumentQuery"
        ..annotations.addAll([const Reference("immutable")])
        ..extend = Reference("ModelQueryBase<\$${model.name}Document>")
        ..constructors.addAll([
          Constructor(
            (c) => c
              ..constant = true
              ..requiredParameters.addAll([
                Parameter(
                  (p) => p
                    ..name = "modelQuery"
                    ..toThis = true,
                )
              ]),
          )
        ])
        ..fields.addAll([
          Field(
            (f) => f
              ..name = "modelQuery"
              ..modifier = FieldModifier.final$
              ..type = const Reference("DocumentModelQuery"),
          )
        ])
        ..methods.addAll([
          Method(
            (m) => m
              ..name = "call"
              ..lambda = true
              ..annotations.addAll([const Reference("override")])
              ..returns = Reference("\$${model.name}Document Function(Ref ref)")
              ..body = Code(
                "(ref) => \$${model.name}Document(modelQuery)",
              ),
          ),
          Method(
            (m) => m
              ..name = "name"
              ..lambda = true
              ..type = MethodType.getter
              ..annotations.addAll([const Reference("override")])
              ..returns = const Reference("String")
              ..body = const Code("modelQuery.toString()"),
          ),
        ]),
    ),
  ];
}
