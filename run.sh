#!/bin/sh

set -e
set -x


# cabal component name to run GHCJSi for
name=$1

# always run from a directory this script is in
cd $(dirname $0)

# find out where GHCJS /lib/etc files are located
GHCJS_LIB_ETC_PATH=$(dirname $(stack path --global-pkg-db))

# replace irunner.js to enable static file server
cp $HOME/ghcjs/lib/etc/irunner.js ${GHCJS_LIB_ETC_PATH}/irunner.js

# specify a directory to serve static files from
export GHCJSI_STATIC_DIR=$(pwd)/examples/$name/static

# run GHCJSi
# include :lib to reload library code too using :r in GHCJSi
stack ghci miso-aframe:lib miso-aframe:exe:$name
