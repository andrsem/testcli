#!/bin/bash

set -e

swift format . -ri
FORMAT_FAILED=0
if [[ -n "$(git status --porcelain)" ]]; then
   echo "❌ swift format modified files. Please run 'swift format . -ri' locally."
   git status
   FORMAT_FAILED=1
fi

LINT_OUTPUT=$(swift format lint . -r)
echo "$LINT_OUTPUT"
LINT_FAILED=0
if [[ -n "$LINT_OUTPUT" ]]; then
   echo "❌ swift format lint found issues."
   LINT_FAILED=1
fi

# Fail if either format or lint failed
if [[ $FORMAT_FAILED -eq 1 || $LINT_FAILED -eq 1 ]]; then
   exit 1
fi
