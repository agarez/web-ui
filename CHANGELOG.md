# changelog

This file contains highlights of what changes on each version of the web_ui
package. This file is normally updated whenever we push a new version to pub.

#### Pub version 0.4.5 - Apr 8 2013 (integration SDK 0.4.5.1 r21094)
  * Support for bindings in id attributes (issue #284)
  * Use native DOM node type that is being extended in tags (issue #82)
  * Use presice KeyEvent type on some keyboard events (see #357)
  * Added 'template-repeat' that, unlike template-iterate, if used as an
    attribute it repeats the tag instead of the children of the tag.
  * Bug fixes:
    * Fixed checked-mode errors in observable: workaround for underlying bugs
      with mixin in the VM and dart2js.
    * Additional testing of build.dart

#### Pub version 0.4.4+1 - Apr 8 2013 (integration SDK 0.4.4 r20690)
  * Hot fix for windows bug: mapping of generated files was not printed
    correctly from build.dart, so the editor was not mapping/opening correctly
    the target generated .html file when launching the input .html file.

#### Pub version 0.4.4 - Mar 30 2013 (integration SDK 0.4.4 r20690)
  * data binding for input type=file (thanks to @yohcop!)
  * Switch observable to be a mixin
  * Bug fixes:
    - fix warning from new SDK (insertionPoint added to DOM)
    - observable map iterators behaving incorrectly (fix #422)
    - print more accurate error messages when files are not found (fix #435)
    - don't update DOM properties when value is the same (fix #368)
    - Implement == in SafeHtml and SafeUri

#### Pub version 0.4.3+1 - Mar 28 2013 (integration SDK 0.4.3+5 r20602)
  * Bug fixes: fix import-urls in windows (issue #420)
  * Provide warnings when using bindings in ID attributes.

#### Pub version 0.4.2+5 - Mar 25 2013 (integration SDK 0.4.2+0 r20157)
  * Bug fix: fix bug where bogus error messages were given when trying to
    compile files in windows (input file mistakenly thought as being in the
    output directory)

#### Pub version 0.4.2+3 - Mar 11 2013 (integration SDK 0.4.2+0 r20157)
  * Add new library "testing/render_test.dart" for running DumpRenderTree
    tests on code that uses DWC. See example/todomvc for how to use it.
  * Fix bug with "overlapping edits" that could occur in some situations
    with part directives.
  * Fix bugs in CSS version constraint and always copying files to output.
  * Updates for breaking changes in SDK, and other bug fixes.

#### Pub version 0.4.1+6 - Mar 11 2013 (integration SDK 0.4.1+0 r19425)
  * Work around for dart2js "internal error" in LinkedListIterator.

#### Pub version 0.4.1+4 - Mar 7 2013 (integration SDK 0.4.1+0 r19425)
  * Scoped styles are on by default.
  * Custom tags no longer need to start with x-, but must contain a dash.
  * Observable objects now have a change record API. You can listen to all
    changes on an object using `observeChanges`.
  * Importing Dart files that define web components should work even if
    they aren't used on the page.
  * Warning for incorrect use of if/iterate on the element's template.
  * Support "package:" URI scheme for link rel=component tag.
  * Various bug fixes and fixes to run on latest SDK.

#### Pub version 0.4.0 - Feb 27 2013 (integration SDK 0.3.7+5 r18669)
  * Performance improvements: cache HTML fragments and use .clone in templates
  * BREAKING CHANGE: removed deprecated attributes (data-value, data-action,
    data-bind). Detailed announcement at web-ui@dartlang.org.
  * New flags in dwc to specify package root and disable rewrites of urls (for
    deployment)
  * Bug fixes: using @observables in component files with external sources
    indentation="remove" on template elements to remove any indentation spaces,
    use indentation="preserve" to switch back to the original behavior.

#### Pub version 0.3.3+4 - Feb 25 2013 (integration SDK 0.3.7+5 r18669)
  * Changes to the trim-indentation feature: use
    indentation="remove" on template elements to remove any indentation spaces,
    use indentation="preserve" to switch back to the original behavior.

#### Pub version 0.3.3+3 - Feb 22 2013 (integration SDK 0.3.7+5 r18669)
  * Backward compatible changes needed to make web-ui run correctly in the newer
    SDK (0.4.0)

#### Pub version 0.3.3+2 - Feb 19 2013 (integration SDK 0.3.7+5 r18669)
  * Minor cleanup

#### Pub version 0.3.3+1 - Feb 19 2013 (integration SDK 0.3.7+5 r18669)
  * Bug fixes on observables: tracing dependencies correctly.

#### Pub version 0.3.3 - Feb 19 2013 (integration SDK 0.3.7+5 r18669)
  * New features:
    * Observables: a scalable and efficient replacement for watchers.
      Watchers dirty checks to see if anything had changed. Observables track
      modifications directly. They are not on by default, you can switch by
      adding the `@observable` annotation on your model fields.
    * Source-maps in Dartium: enable source maps in the debugging options of
      Dartium, and see the web inspector step through your original code when
      you debug.
    * One-time final bindings: use '{{ binding | final }}' to initialize a value
      in your template when it is first rendered. This binding ignores any
      updates to the model afterwards.
    * Use spaces freely inside a component: indentation spaces (e.g. line breaks
      after a tag, or a binding) are ignored when adding the attribute
      'trim-indentation-spaces' to the `<template>` tag on an element
      declaration.
    * experimental css processing (hidden under a flag)
  * Bug fix: dwc avoids generating imports that duplicate existing
    imports from the user
  * API changes: updates for the lastest changes in the SDK

#### Pub version 0.3.2 - Feb 5 2013 (integration SDK r18115)
  * bug fix: allow 2 entry points to depend on a common component (we used to write files
    asynchronously and thus the two parallel compilation processes where corrupting each
    other's result).
  * changes for the new SDK: API in dart:html changed for getComputedStyle (now it is sync)

#### Pub version 0.3.1+3 - Feb 1 2013 (integration SDK r17657)
  * bug fixes in watchers library: watchers were being fired out of order at times
    (e.g. when template-conditionals are false, watchers of child nodes should not 
     be fired, but they were). Another bug was making watchers being checked 10
     times, instead of 1.
   * better warnings when missing script type.

#### Pub version 0.3.1+2 - Jan 30 2013 (integration SDK r17657)
  * Fix bug in previous version where it did not work with html5lib 0.3.1+2.

#### Pub version 0.3.1+1 - Jan 30 2013 (integration SDK r17657)
  * Richer 'style' attributes. Deprecate 'data-style', functionality merged into
    'style'.
  * Support constant attributes when passing data to web components
  * load 'dart.js' directly from the browser package (generated code works
    offline!)
  * bug fix: warnings were not being printed.

#### Pub version 0.3.1 - Jan 28 2013 (integration SDK r17657)
  * fixes for new release of the SDK
  * bug fix: --full not required when using build.dart on a terminal

#### Pub version 0.3.0+2 - Jan 24 2013
  * support for --full option in build.dart. This is used by the editor, but it
    broke the command-line use of build.dart, fixed in 0.3.1.
  * bug fix: runtime exception in code used to send warnings to the editor.

#### Pub version 0.3.0+1 - Jan 23 2013
  * fixes for changes in core libraries that were added after the pre-release of
  * the new libraries.

#### Pub version 0.3.0 - Jan 22 2013
  * Changes to use the new libraries (lib v2)
  * More readable output: generated code is more compact and easy to correlate
    with source templates
  * Making some declarations optional:
      * You can omit the script tag in the entry page, we will generate
        an empty one for you.
        **NOTE**: make sure you only put entrypoint html files in 'build.dart'.
        This change makes the compiler accept any html file (including files
        that only define components) and treat them as entrypoints.
        If you include a component's html file in build.dart, the compiler will
        generate additional files that you don't need.
      * Components with no 'extends' attribute extend from 'span' by default
  * bug fixes:
       * remove extra whitespace incorrectly inserted in components
       * issue warning when a component definition can't be found.

#### Pub version 0.2.11 - Jan 07 2013 (integration SDK r16761)
  * internal changes in code structure
  * fix for type errors with templates in SVG

#### Pub version 0.2.10+2 - Dec 17 (integration SDK 16251)
  * Bug fix: build.dart kept running nonstop (wihtin the Editor) if you had components code under a subdirectory.

#### Pub version 0.2.10, 0.2.10+1 - Dec 12 (integration SDK 16251)
  * Updates to comply with trunk SDK 16102 (part of next trunk release)

#### Pub version 0.2.9 - Dec 11 (SDK 15948)
  * Updates to comply with all breaking changes in the new trunk SDK

#### Pub version 0.2.8+6 - Dec 10 (SDK 15595, integration SDK 15699)

  * Bug fix:
    * No longer generates calls to Element constructors that don't exist
      (affected heading and strong elements, among others)

#### Pub version 0.2.8+5 - Dec 7 (SDK 15595, integration SDK 15699)

  * Rename package to web_ui
  * Change TodoMVC to have component with composition
  * Bug fix:
    * fix component composition in Firefox (workaround dart:html matchesSelector)

#### Pub version 0.2.8+4 - Dec 7 (trunk SDK 15595, integration SDK 15699)

  * Support for forwarding error messages and file mappings to the editor
  * Bug fixes:
    * errors in Firefox
    * allow including web-components from packages/...
    * fix --basedir
    * bugs with id when using nested components (component composition)

#### Pub version 0.2.8+3 - Nov 30 (trunk SDK 15595, integration SDK 15699)

  * Upgrades for new trunk release (mainly breaking changes in dart:html)

#### Pub version 0.2.8+2 - Nov 30 (trunk SDK 15355)

  * Bug fix:
    * hosted and sdk dependencies errors due to changes in html5lib.
    * URI attributes are now checked for XSS: use SafeUri if validation is too
      strict.

#### Pub version 0.2.8+1 - Nov 30 (SDK 15355)

  * Accept, but ignore, the new editor flag '--machine' in build.dart

### Pub version 0.2.8 - Nov 30 (SDK 15355)

  * Two-way binding changes:
    * New syntax: `bind-attribute="dartAssignableValue"`, `data-bind` is
      deprecated
    * Support for radio buttons
    * Support for valueAsDate and valueAsNumber
    * Better detection of error conditions, like duplicate value attributes.

  * Binding in components:
    * you can use `attribute="{{}}"` and `bind-attribute="x"` to initialize,
      update, and bind fields of components (exposed as attributes in the HTML
      tag).

  * Conditional templates:
    * Added new experimental syntax `<template if="exp">`.

  * Bug fixes:
    * Make dartium extension use the latest dart.js
    * html fragments: fix issues with text nodes mixed with elements
    * Internally data bindings watch the result of 'toString()', so types
      implementing toString (like Maps or StringBuffer) can be used directly in
      templates.
    * Most generated identifiers are now hidden: all identifiers generated for
      html elements in the template are hidden, except '_root'. Root will be
      hidden in the future.

#### Pub version 0.2.7 - Nov 26 (SDK 15355)

  * New syntax for inline event handlers: `on-click="increment($event)"` instead
    of `data-action="click:increment"`
  * Added new explainer examples
  * Updated dartium extension
  * Bug fixes:
      * Support for querying for elements from main()
      * Recursive imports between components
      * Warnings are emitted (previously they were generated but not printed)

#### Pub version 0.2.6+1 - 16 Nov 2012

  * Name mangling turned off if --out is specified
  * Support for `<select>` in data-bind

#### Pub version 0.2.5+5

  * Bug fix: adds missing id on elements that we query in generated code

#### Pub version 0.2.5+4

  * Bug fix: additional fixes for symlinks in windows

#### Pub version 0.2.5+3

  * Fixes symlinks for windows
  * Support for composition and extension
  * Support for list and spaces in bindings of class attribtues
  * Simpliffications in generated code
  * Allow text bindings and fragments in conditions an iterations
  * Support text nodes and fragments at the top level of components

See git version tags for older changes.
