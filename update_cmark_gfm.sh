#!/bin/sh

# Usage:
#     Update to the latest cmark-gfm version:
#         ./update_cmark_gfm.sh
#     Update to the specified cmark-gfm commit:
#         ./update_cmark_gfm.sh [commit]

# Clear cmark directory
rm -rf Sources/CMarkGFM
mkdir -p Sources/CMarkGFM

# Clone cmark-gfm and checkout a commit if specified
git clone https://github.com/github/cmark-gfm.git
if [ -n "$1" ]; then
    cd cmark-gfm
    git checkout $1 .
    cd ..
fi

# Copy `COPYING`
cp cmark-gfm/COPYING Sources/CMarkGFM

# Copy source files
mkdir -p Sources/CMarkGFM
cp cmark-gfm/src/*.{inc,c,h} Sources/CMarkGFM
cp cmark-gfm/extensions/*.{c,h} Sources/CMarkGFM

# Delete `main.c` because it causes issues
rm Sources/CMarkGFM/main.c

# Create generated files
mkdir cmark-gfm/build
cd cmark-gfm/build
cmake ..
cd ../..

# Copy generated files
cp cmark-gfm/build/src/*.h Sources/CMarkGFM
cp cmark-gfm/build/extensions/*.h Sources/CMarkGFM

# Clean up
rm -rf cmark-gfm
