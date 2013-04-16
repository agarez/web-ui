// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library css_warning_test;

import 'package:html5lib/dom.dart';
import 'package:logging/logging.dart' show Level;
import 'package:unittest/compact_vm_config.dart';
import 'package:unittest/unittest.dart';
import 'testing.dart';
import 'package:web_ui/src/messages.dart';

main() {
  useCompactVMConfiguration();

  Map createFiles() {
    return {
      'index.html': '<!DOCTYPE html>'
                    '<html lang="en">'
                      '<head>'
                        '<meta charset="utf-8">'
                        '<link rel="components" href="foo.html">'
                      '</head>'
                      '<body>'
                        '<x-foo></x-foo>'
                        '<script type="application/dart">main() {}</script>'
                      '</body>'
                    '</html>',
      'foo.html': '<!DOCTYPE html>'
                  '<html lang="en">'
                    '<head>'
                      '<meta charset="utf-8">'
                    '</head>'
                    '<body>'
                      '<element name="x-foo" constructor="Foo">'
                        '<template>'
                          '<style scoped>'
                            '@import "foo.css";'
                            '.main { color: var(main_color); }'
                            '.test-background { '
                              'background:  url(http://www.foo.com/bar.png);'
                            '}'
                          '</style>'
                        '</template>'
                      '</element>'
                    '</body>'
                  '</html>',
      'foo.css':  r'''@main_color: var(b);
                      @b: var(c);
                      @c: red;
                      
                      @one: var(two);
                      @two: var(one);
                      
                      @four: var(five);
                      @five: var(six);
                      @six: var(four);
                      
                      @def-1: var(def-2);
                      @def-2: var(def-3);
                      @def-3: var(def-2);''',
    };
  }

  test('var- and Less @define', () {
    var compiler = createCompiler(createFiles(), errors: true);

    compiler.run().then(expectAsync1((e) {
      MockFileSystem fs = compiler.fileSystem;
      expect(fs.readCount, equals({
        'index.html': 1,
        'foo.html': 1,
        'foo.css': 1
      }), reason: 'Actual:\n  ${fs.readCount}');

      var cssInfo = compiler.info['foo.css'];
      expect(cssInfo.styleSheets.length, 1);
      var htmlInfo = compiler.info['foo.html'];
      expect(htmlInfo.styleSheets.length, 0);
      expect(htmlInfo.declaredComponents.length, 1);
      expect(htmlInfo.declaredComponents[0].styleSheets.length, 1);

      var outputs = compiler.output.map((o) => o.path);
      expect(outputs, equals([
        'out/foo.html.dart',
        'out/foo.html.dart.map',
        'out/index.html.dart',
        'out/index.html.dart.map',
        'out/index.html_bootstrap.dart',
        'out/foo.css',
        'out/index.html.css',
        'out/index.html',
      ]));

      for (var file in compiler.output) {
        if (file.path == 'out/index.html.css') {
          expect(file.contents,
              '/* Auto-generated from components style tags. */\n'
              '/* DO NOT EDIT. */\n\n'
              '/* ==================================================== \n'
              '   Component x-foo stylesheet \n'
              '   ==================================================== */\n'
              '@import "foo.css";\n'
              '.x-foo_main {\n'
              '  color: #f00;\n'
              '}\n'
              '.x-foo_test-background {\n'
              '  background: url("http://www.foo.com/bar.png");\n'
              '}\n\n');
        } else if (file.path == 'out/foo.css') {
          expect(file.contents,
              '/* Auto-generated from style sheet href = foo.css */\n'
              '/* DO NOT EDIT. */\n\n\n\n');
        }
      }

      // Check for warning messages about var- cycles.
      expect(messages.messages.length, 8);
      expect(messages.messages.toString(),
          '[[35mwarning [0m:12:23: var cycle detected var-def-1\n'
          '                      [35m@def-1: var(def-2)[0m;\n'
          '                      [35m^^^^^^^^^^^^^^^^^^[0m, '
          '[35mwarning [0m:9:23: var cycle detected var-five\n'
          '                      [35m@five: var(six)[0m;\n'
          '                      [35m^^^^^^^^^^^^^^^[0m, '
          '[35mwarning [0m:10:23: var cycle detected var-six\n'
          '                      [35m@six: var(four)[0m;\n'
          '                      [35m^^^^^^^^^^^^^^^[0m, '
          '[35mwarning [0m:14:23: var cycle detected var-def-3\n'
          '                      [35m@def-3: var(def-2)[0m;\n'
          '                      [35m^^^^^^^^^^^^^^^^^^[0m, '
          '[35mwarning [0m:6:23: var cycle detected var-two\n'
          '                      [35m@two: var(one)[0m;\n'
          '                      [35m^^^^^^^^^^^^^^[0m, '
          '[35mwarning [0m:13:23: var cycle detected var-def-2\n'
          '                      [35m@def-2: var(def-3)[0m;\n'
          '                      @def-3: var(def-2);\n'
          '                      [35m^^^^^^^^^^^^^^^^^^[0m, '
          '[35mwarning [0m:5:23: var cycle detected var-one\n'
          '                      [35m@one: var(two)[0m;\n'
          '                      [35m^^^^^^^^^^^^^^[0m, '
          '[35mwarning [0m:8:23: var cycle detected var-four\n'
          '                      [35m@four: var(five)[0m;\n'
          '                      [35m^^^^^^^^^^^^^^^^[0m]');
      }));
  });
}
