import 'dart:io';

import 'package:pubspec_yaml_2/pubspec_yaml_2.dart';
import 'package:test/test.dart';

void main() {
  group('given realistic pubspec.yaml content', () {
    final realisticPubspec = File(
      '${gitRepoRoot()}/pubspec.yaml',
    ).readAsStringSync();

    group('$PubspecYaml.loadFromYamlString', () {
      test('does not crash', realisticPubspec.toPubspecYaml);
    });

    group('$PubspecYaml.toYamlString', () {
      test('preserves equivalence', () {
        final pubspecYaml = realisticPubspec.toPubspecYaml();
        expect(pubspecYaml.toYamlString().toPubspecYaml(), pubspecYaml);
      });
    });
  });
}

String gitRepoRoot() => (Process.runSync(
      'git',
      ['rev-parse', '--show-toplevel'],
      // ignore: avoid_as
    ).stdout as String)
        .trim();
