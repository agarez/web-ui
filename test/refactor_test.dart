// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library web_ui.test.refactor_test;

import 'package:unittest/compact_vm_config.dart';
import 'package:unittest/unittest.dart';
import 'package:web_ui/src/refactor.dart';
import 'package:source_maps/span.dart';

main() {
  useCompactVMConfiguration();
  var original = "0123456789abcdefghij";
  var file = new SourceFile.text('', original);

  test('non conflicting, in order edits', () {
    var txn = new TextEditTransaction(original, file);
    txn.edit(2, 4, '.');
    txn.edit(5, 5, '|');
    txn.edit(6, 6, '-');
    txn.edit(6, 7, '_');
    expect((txn.commit()..build('')).text, "01.4|5-_789abcdefghij");
  });

  test('non conflicting, out of order edits', () {
    var txn = new TextEditTransaction(original, file);
    txn.edit(2, 4, '.');
    txn.edit(5, 5, '|');

    // Regresion test for issue #404: there is no conflict/overlap for edits
    // that don't remove any of the original code.
    txn.edit(6, 7, '_');
    txn.edit(6, 6, '-');
    expect((txn.commit()..build('')).text, "01.4|5-_789abcdefghij");

  });

  test('non conflicting edits', () {
    var txn = new TextEditTransaction(original, file);
    txn.edit(2, 4, '.');
    txn.edit(3, 3, '-');
    expect(() => txn.commit(), throwsA(predicate(
          (e) => e.toString().contains('overlapping edits'))));
  });
}
