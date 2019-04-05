#!/usr/bin/env bash

mvn --settings .ci/settings.xml deploy -DskipTests=true -B -V