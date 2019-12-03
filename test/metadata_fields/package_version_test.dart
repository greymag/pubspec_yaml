/*
 * MIT License
 *
 * Copyright (c) 2019 Alexei Sintotski
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 * */

import 'package:pubspec_yaml/src/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with package version', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithPackageVersionDefined);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct package version', () {
        expect(pubspecYaml.version.valueOr(null), packageVersion);
      });
      test('produces object without custom fields', () {
        expect(pubspecYaml.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      final outputYaml = pubspecYaml.toYamlString();
      test('produces string equivalent to the input', () {
        expect(outputYaml, pubspecYamlWithPackageVersionDefined);
      });
    });
  });

  group('given pubspec.yaml with undefined package version', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithUndefinedVersion);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object without package version defined', () {
        expect(pubspecYaml.version.hasValue, isFalse);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      final outputYaml = pubspecYaml.toYamlString();
      test('produces string equivalent to the input', () {
        expect(outputYaml, pubspecYamlWithUndefinedVersion);
      });
    });
  });
}

const packageVersion = '1.0.0';
const pubspecYamlWithPackageVersionDefined = '''
name: pubspec_yaml
version: "$packageVersion"
''';

const pubspecYamlWithUndefinedVersion = '''
name: pubspec_yaml
''';
