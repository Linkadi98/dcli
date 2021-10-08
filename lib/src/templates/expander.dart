// ignore: prefer_relative_imports
import 'package:dcli/dcli.dart';

/// GENERATED -- GENERATED
///
/// DO NOT MODIFIY
///
/// This script is generated via tool/build_templates.dart which is
/// called by pub_release (whicih runs any scripts in the  tool/pre_release_hook directory)
///
/// GENERATED - GENERATED

class TemplateExpander {
  /// Creates a template expander that will expand its files int [targetPath]
  TemplateExpander(this.targetPath);

  /// The path the templates will be expanded into.
  String targetPath;

  /// Expander for analysis_options
  // ignore: non_constant_identifier_names
  void analysis_options() {
    join(targetPath, 'analysis_options.yaml.template').write(
      // ignore: unnecessary_raw_strings
      r'''

include: package:lints/recommended.yaml

# For lint rules and documentation, see http://dart-lang.github.io/linter/lints.
# Uncomment to specify additional rules.
linter:
  
  rules:
    lines_longer_than_80_chars: false
    camel_case_types: true
    always_declare_return_types: true
  

analyzer:
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false''',
    );
  }

  /// Expander for basic
  // ignore: non_constant_identifier_names
  void basic() {
    join(targetPath, 'basic.dart').write(
      // ignore: unnecessary_raw_strings
      r'''
#! /usr/bin/env %dcliName%

import 'dart:io';

import 'package:args/args.dart';

// ignore: prefer_relative_imports
import 'package:dcli/dcli.dart';

/// dcli script generated by:
/// dcli create %scriptname%
///
/// See
/// https://pub.dev/packages/dcli#-installing-tab-
///
/// For details on installing dcli.
///

void main(List<String> args) {
  final parser = ArgParser()
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Logs additional details to the cli',
    )
    ..addOption('prompt', abbr: 'p', help: 'The prompt to show the user.');

  final parsed = parser.parse(args);

  if (parsed.wasParsed('verbose')) {
    Settings().setVerbose(enabled: true);
  }

  if (!parsed.wasParsed('prompt')) {
    printerr(red('You must pass a prompt'));
    showUsage(parser);
  }

  final prompt = parsed['prompt'] as String;

  var valid = false;
  String response;
  do {
    response = ask('$prompt:', validator: Ask.all([Ask.alpha, Ask.required]));

    valid = confirm('Is this your response? ${green(response)}');
  } while (!valid);

  print(orange('Your response was: $response'));
}

/// Show useage.
void showUsage(ArgParser parser) {
  print('Usage: %scriptname% -v -prompt <a questions>');
  print(parser.usage);
  exit(1);
}''',
    );
  }

  /// Expander for cmd_args
  // ignore: non_constant_identifier_names
  void cmd_args() {
    join(targetPath, 'cmd_args.dart').write(
      // ignore: unnecessary_raw_strings
      r'''
#! /usr/bin/env %dcliName%

import 'dart:io';

import 'package:args/args.dart';
// ignore: prefer_relative_imports
import 'package:dcli/dcli.dart';

/// dcli script generated by:
/// dcli create %scriptname%
///
/// See
/// https://pub.dev/packages/dcli#-installing-tab-
///
/// For details on installing dcli.
///

void main(List<String> args) {
  final parser = ArgParser()
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Logs additional details to the cli',
    )
    ..addOption('prompt', abbr: 'p', help: 'The prompt to show the user.');

  final parsed = parser.parse(args);

  if (parsed.wasParsed('verbose')) {
    Settings().setVerbose(enabled: true);
  }

  if (!parsed.wasParsed('prompt')) {
    printerr(red('You must pass a prompt'));
    showUsage(parser);
  }

  final prompt = parsed['prompt'] as String;

  var valid = false;
  String response;
  do {
    response = ask('$prompt:', validator: Ask.all([Ask.alpha, Ask.required]));

    valid = confirm('Is this your response? ${green(response)}');
  } while (!valid);

  print(orange('Your response was: $response'));
}

/// Show the usage.
void showUsage(ArgParser parser) {
  print('Usage: %scriptname% -v -prompt <a questions>');
  print(parser.usage);
  exit(1);
}''',
    );
  }

  /// Expander for hello_world
  // ignore: non_constant_identifier_names
  void hello_world() {
    join(targetPath, 'hello_world.dart').write(
      // ignore: unnecessary_raw_strings
      r'''
#! /usr/bin/env %dcliName%

// ignore: prefer_relative_imports,  unused_import
import 'package:dcli/dcli.dart';

/// dcli script generated by:
/// dcli create $scriptname
///
/// See
/// https://pub.dev/packages/dcli#-installing-tab-
///
/// For details on installing dcli.
///

void main() {
  print('Hello World');
}''',
    );
  }

  /// Expander for pubspec
  // ignore: non_constant_identifier_names
  void pubspec() {
    join(targetPath, 'pubspec.yaml.template').write(
      // ignore: unnecessary_raw_strings
      r'''
name: %scriptname%
version: 0.0.1
description: A script generated by dcli.
environment: 
  sdk: '>=2.14.1 <3.0.0'
dependencies: 
  args: ^2.0.0
  dcli: ^1.9.0
  path: ^1.8.0

dev_dependencies:
  lints: ^1.0.0

''',
    );
  }

  /// Expander for README
  // ignore: non_constant_identifier_names
  void README() {
    join(targetPath, 'README.md').write(
      // ignore: unnecessary_raw_strings
      r'''
This directory contains the templates used by dcli create

Eventually you will be able to run
 dcli create --template cli_args.dart snake.dart''',
    );
  }

  /// Expand all templates.
  void expand() {
    analysis_options();
    basic();
    cmd_args();
    hello_world();
    pubspec();
    README();
  }
}
