// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * This is a helper for run.sh. We try to run all of the Dart code in one
 * instance of the Dart VM to reduce warm-up time.
 */
library run_impl;

import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math' show min;
import 'dart:utf' show encodeUtf8;
import 'package:pathos/path.dart' as path;
import 'package:unittest/compact_vm_config.dart';
import 'package:unittest/unittest.dart';
import 'package:web_ui/dwc.dart' as dwc;
import 'package:web_ui/testing/render_test.dart';

import 'analyzer_test.dart' as analyzer_test;
import 'css_test.dart' as css_test;
import 'compiler_test.dart' as compiler_test;
import 'emitter_test.dart' as emitter_test;
import 'html5_utils_test.dart' as html5_utils_test;
import 'html_cleaner_test.dart' as html_cleaner_test;
import 'linked_list_test.dart' as linked_list_test;
import 'observe_test.dart' as observe_test;
import 'paths_test.dart' as paths_test;
import 'refactor_test.dart' as refactor_test;
import 'utils_test.dart' as utils_test;
import 'watcher_test.dart' as watcher_test;

main() {
  var args = new Options().arguments;
  var pattern = new RegExp(args.length > 0 ? args[0] : '.');

  useCompactVMConfiguration();

  void addGroup(testFile, testMain) {
    if (pattern.hasMatch(testFile)) {
      group(testFile.replaceAll('_test.dart', ':'), testMain);
    }
  }

  addGroup('analyzer_test.dart', analyzer_test.main);
  addGroup('compiler_test.dart', compiler_test.main);
  addGroup('css_test.dart', css_test.main);
  addGroup('emitter_test.dart', emitter_test.main);
  addGroup('html5_utils_test.dart', html5_utils_test.main);
  addGroup('html_cleaner_test.dart', html_cleaner_test.main);
  addGroup('linked_list_test.dart', linked_list_test.main);
  addGroup('observe_test.dart', observe_test.main);
  addGroup('paths_test.dart', paths_test.main);
  addGroup('refactor_test.dart', refactor_test.main);
  addGroup('utils_test.dart', utils_test.main);
  addGroup('watcher_test.dart', watcher_test.main);

  // Note: if you're adding more render test suites, make sure to update run.sh
  // as well for convenient baseline diff/updating.
  renderTests('data/input', 'data/input', 'data/expected', 'data/out');
  exampleTest('../example/component/news');
  exampleTest('../example/todomvc');
}

void exampleTest(String path) {
  renderTests(path, '$path/test', '$path/test/expected', '$path/test/out');
}
