#!/bin/bash
source exports.sh
VARS_H=../vars.h
sed -i "s/__BUGSPLAT_DATABASE__/${BUGSPLAT_DATABASE}/g" $VARS_H
sed -i "s/__BUGSPLAT_APP_NAME__/${BUGSPLAT_APP_NAME}/g" $VARS_H
sed -i "s/__BUGSPLAT_APP_VERSION__/${BUGSPLAT_APP_VERSION}/g" $VARS_H
cat $VARS_H

clang++ -pthread $PROJECT_DIR/main.cpp \
    $CRASHPAD_DIR/lib/libcommon.a \
    $CRASHPAD_DIR/lib/libclient.a \
    $CRASHPAD_DIR/lib/libutil.a \
    $CRASHPAD_DIR/lib/libbase.a \
    -I$CRASHPAD_DIR/include \
    -I$CRASHPAD_DIR/include/third_party/mini_chromium/mini_chromium \
    -I$CRASHPAD_DIR/include/out/Default/gen \
    -o$OUT_DIR/$MODULE_NAME \
    -g \
    -Wl,--build-id

