// Copyright 2023 mathru. All rights reserved.

/// All platform plugin for masamune_picker. Base package for retrieving files such as images and videos from terminal storage, cameras, etc.
///
/// To use, import `package:masamune_picker_file/masamune_picker_file.dart`.
///
/// [mathru.net]: https://mathru.net
/// [YouTube]: https://www.youtube.com/c/mathrunetchannel
library masamune_picker_file;

// Dart imports:
import 'dart:async';

// Package imports:
import 'package:file_picker/file_picker.dart';
import 'package:masamune_picker/masamune_picker.dart';

export 'package:masamune_picker/masamune_picker.dart';

part 'adapter/file_picker_masamune_adapter.dart';
