#!/bin/bash

set -e

swift format . -ri
FORMAT_FAILED=0
if [[ -n "$(git status -s)" ]]; then
   echo "❌ swift format modified files. Please run 'swift format . -ri' locally."
   git status -s
   FORMAT_FAILED=1
fi

LINT_FAILED=0
LINT_OUTPUT=$(swift format lint . -r | tee /dev/stderr)
if [[ $(echo "$LINT_OUTPUT" | wc -l) -gt 0 ]]; then
   echo "❌ swift format lint found issues."
   LINT_FAILED=1
fi

# Fail if either format or lint failed
if [[ $FORMAT_FAILED -eq 1 || $LINT_FAILED -eq 1 ]]; then
   exit 1
fi
