#!/bin/bash

set -e 

./gradlew clean test | tee test.out.log 
