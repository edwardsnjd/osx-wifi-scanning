#!/bin/bash

# Simplify `airport` scan output format, which is fixed width and aligned, into
# tab delimited fields

# NOTE: Use `sed -u` to allow for unbuffered streaming so we can watch it live

sed -Eu 's/^(.{54}).*$/\1/' \
| sed -Eu 's/^(.{32}) (.{17}) /\1\t\2\t/;' \
| sed -Eu 's/^ +//'
