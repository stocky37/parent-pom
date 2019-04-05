#!/usr/bin/env bash

mvn --settings .ci/settings.xml \
    build-helper:parse-version \
    release:prepare \
    release:perform \
    -DskipTests=true \
    -P minor \
    -B -V