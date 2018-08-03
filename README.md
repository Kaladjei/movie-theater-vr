# Movie-Theater

A movie theater virtual reality application built with miso-aframe

### Documentation for miso-aframe

See Haddock documentation at https://fizruk.github.io/miso-aframe/doc/index.html

### How to build

```
stack setup
stack build
```

### How to run

To run use `run.sh` script:

```
./run.sh movie-theater
```

When GHCJSi has loaded open your browser and point to
http://localhost:6401/ghcjsiClient.html
(this is a custom REPL page with A-Frame script sources specified).

Now run (or reload) the app using

```
reloadAFrameApp main
```

If you change the sources you can reload affected modules with

```
:reload
```

And reload the app again with `reloadAFrameApp main`.

This script will build everything if needed and also replace `index.html` when necessary.
If build is complete the script will also `open` the example using default browser.
