#! /usr/bin/env dcli
/* Copyright (C) S. Brett Sutton - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Brett Sutton <bsutton@onepub.dev>, Jan 2022
 */




import 'package:dcli/dcli.dart';

/// dcli script generated by:
/// dcli create run_coverage.dart
///
/// See
/// https://pub.dev/packages/dcli#-installing-tab-
///
/// For details on installing dcli.
///

void main() {
  final projectRoot = findProjectRoot();

  final coveragePath = join(projectRoot, 'coverage');

  if (!exists(coveragePath)) {
    createDir(coveragePath);
  }
  final url = 'dart --pause-isolates-on-exit '
          '--enable-vm-service=NNNN '
          '${join(projectRoot, 'tool', 'run_unit_tests.dart')}'
      .toList();
  'collect_coverage -o $coveragePath/coverage.json --uri$url'.run;
  'format_coverage -l -i $coveragePath/coverage.json -o $coveragePath/lcov.info --packages=${join(projectRoot, DartSdk().pathToPackageConfig)} --report-on=lib'
      .run;
}

/// Find the directory that has a pubspec.yaml
String findProjectRoot() {
  var root = pwd;

  do {
    if (exists(join(root, 'pubspec.yaml'))) {
      break;
    }
    root = dirname(root);
  } while (root != rootPath);

  return root;
}
