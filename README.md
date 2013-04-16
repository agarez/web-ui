Web UI
===========

Web UI lets you build web apps as if you had a browser from the future. You can
use the cool new web technologies like [Web Components][wc],
and features like dynamic templates and live data binding inspired by
[Model Driven Views][mdv] and [Dart][d] today. Build apps easily using HTML as
your template language, express your application's components in HTML, and
synchronize your data automatically between Dart and your components.

We believe that:

- Web Components and MDV are on their way, we should start using them now.
- Cool new features should be made available to [modern browsers][mb] that
  haven't yet implemented them.
- Write/reload is just as important as write/compile/minimize/ship.
- Working in open source is the way to go.
- Developers from all backgrounds should be building awesome modern web apps.

[![](https://drone.io/dart-lang/web-ui/status.png)](https://drone.io/dart-lang/web-ui/latest)

Try It Now
-----------
Add the Web UI package to your pubspec.yaml file, selecting a version range
that works with your version of the SDK. For example:

```yaml
dependencies:
  web_ui: ">=0.4.1 <0.4.2"    # works with SDK 19425
```

Versions change within the range when we release small bug fixes, but it
changes outside of the range on any breaking change. See our
[changelog][changelog] to find the version that works best for you.

If you continually update your SDK, you can use the latest version of web_ui:

```yaml
dependencies:
  web_ui: any
```

Learn More
----------

* [Read an overview][overview]
* [Setup your tools][tools]
* [Browse the features][features]
* [Dive into the specification][spec]

See our [TodoMVC][] example [running][todo_live]. Read the
[README.md][todo_readme] in `example/todomvc` for more details.


Running Tests
-------------

Dependencies are installed using the [Pub Package Manager][pub].
```bash
pub install

# Run command line tests and automated end-to-end tests. It needs two
# executables on your path: `dart` and `DumpRenderTree` (see below
# for links to download `DumpRenderTree`)
test/run.sh
```
Note: to run browser tests you will need to have [DumpRenderTree][drt],
which can be downloaded prebuilt for [Ubuntu Lucid][drtlucid],
[Windows][drtwin], or [Mac][drtmac]. You can also build it from the
[Dartium and DRT sources][drtsrc].

For Linux users all the necessary fonts must be installed see
https://code.google.com/p/chromium/wiki/LayoutTestsLinux

Contacting Us
-------------

Please file issues in our [Issue Tracker][issues] or contact us on the
[Dart Web UI mailing list][mailinglist].

We also have the [Web UI development list][devlist] for discussions about
internals of the code, code reviews, etc.

[wc]: http://dvcs.w3.org/hg/webcomponents/raw-file/tip/explainer/index.html
[mdv]: https://github.com/toolkitchen/mdv/
[d]: http://www.dartlang.org
[mb]: http://www.dartlang.org/support/faq.html#what-browsers-supported
[pub]: http://www.dartlang.org/docs/pub-package-manager/
[drt]: http://www.chromium.org/developers/testing/webkit-layout-tests
[drtlucid]: http://gsdview.appspot.com/dartium-archive/continuous/drt-lucid64.zip
[drtmac]: http://gsdview.appspot.com/dartium-archive/continuous/drt-mac.zip
[drtwin]: http://gsdview.appspot.com/dartium-archive/continuous/drt-win.zip
[drtsrc]: http://code.google.com/p/dart/wiki/BuildingDartium
[TodoMVC]: http://addyosmani.github.com/todomvc/
[todo_readme]: https://github.com/dart-lang/web-ui/blob/master/example/todomvc/README.md
[todo_live]:http://dart-lang.github.io/web-ui/example/todomvc/index.html
[changelog]:https://github.com/dart-lang/web-ui/blob/master/CHANGELOG.md
[issues]:https://github.com/dart-lang/web-ui/issues
[mailinglist]:https://groups.google.com/a/dartlang.org/forum/?fromgroups#!forum/web-ui
[devlist]:https://groups.google.com/a/dartlang.org/forum/?fromgroups#!forum/web-ui-dev
[overview]:http://www.dartlang.org/articles/dart-web-components/
[tools]:https://www.dartlang.org/articles/dart-web-components/tools.html
[spec]:https://www.dartlang.org/articles/dart-web-components/spec.html
[features]:https://www.dartlang.org/articles/dart-web-components/summary.html
