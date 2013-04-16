This folder contains examples used for the explainer article at
http://dartlang.org/articles/dart-web-components/.

To generate all examples, run the script:

    ./build_examples.dart -o output-dir

You can optionally pass a list of input .html files to the script, and the
script will only regenerate those particular examples.

We currently host the generated code under the github pages of this repo at
`dart-lang.github.io/dart-web-components/example/explainer/<...>.html.html`.
The dartlang.org article embeds the running version of the examples using
iframes.

The mechanism to host these examples is to push a copy of them to the `gh-pages`
branch of this repo. There are 2 possible ways to update the samples:

  * **Using 2 clones of dart-web-components**: you'd create 2 clones of the
    repo so that it is easy to tell the tool above to generate files directly in
    the location where we want them. In particular, this consists of the
    following steps:

      # clone dart-web-components
      cd $ALL_REPOS
      git clone git@github.com:dart-lang/web-ui.git pages_clone

      # switch it to the gh-pages branch
      cd pages_clone
      git checkout gh-pages

      # invoke the building script back in the original repo, but specify
      # the new repo as output;
      cd $ALL_REPOS/dart-web-components/example/explainer/
      ./build_examples.dart -o $ALL_REPOS/pages_clone/example/explainer/


  * **Using a temporary directory**: you'd generate files in a temporary
    directory while working on master (or a derived branch), switch to the
    `gh-pages` branch and copy the output from the temporary directory to the
    right place in the repo:

      mkdir /tmp/_something_unique
      ./build_examples.dart -o /tmp/_something_unique
      git checkout gh-pages
      cp /tmp/_something_unique/* .


Once you udpate the examples in `gh-pages` you need to push the new code to the
remote github pages branch.

      git push origin gh-pages

