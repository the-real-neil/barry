#!/usr/bin/env bash
#
# barry/build-o-matic.sh

echo -n                                                         && \
    export PROJECT_DIR=$(dirname $(readlink -f ${BASH_SOURCE})) && \
    mkdir -vp ${PROJECT_DIR}/m4                                 && \
    export BARRY_BUILD_DIR=$(mktemp -t -d barry-build-XXXXXX)   && \
    cd ${BARRY_BUILD_DIR}                                       && \
    autoreconf -ivf ${PROJECT_DIR}                              && \
    export BARRY_PREFIX_DIR=$(mktemp -t -d barry-prefix-XXXXXX) && \
    ${PROJECT_DIR}/configure --prefix=${BARRY_PREFIX_DIR}       && \
    make                                                        && \
    make check                                                  && \
    make distcheck                                              && \
    make install                                                && \
    ${BARRY_PREFIX_DIR}/bin/barry --version                     && \
    ${BARRY_PREFIX_DIR}/bin/barry --help                        && \
    echo "big win"