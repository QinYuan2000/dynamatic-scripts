#!/usr/bin/env bash

#--------------------------------------------------------------------
#- this script clones and builds dynamatic in the official repo
#--------------------------------------------------------------------

SCRIPT_CWD=$PWD
cd $SCRIPT_CWD

set -e

DYNAMATIC_ROOT=$SCRIPT_CWD/dynamatic

mkdir -p $DYNAMATIC_ROOT

# git clone git@github.com:EPFL-LAP/dynamatic.git $DYNAMATIC_ROOT
# track my remote

git clone git@github.com:Jiahui17/dynamatic-mlir.git $DYNAMATIC_ROOT
cd $DYNAMATIC_ROOT

git checkout frontend-compile-options

bash $SCRIPT_CWD/mybuild.sh && echo "successfully built dynamatic"
