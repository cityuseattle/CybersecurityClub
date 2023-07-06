#!/bin/sh
# pre-commit

if git rev-parse --verify HEAD >/dev/null 2>&1
then
    against=HEAD
else
    # Initial commit: diff against an empty tree object
    against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Redirect output to stderr.
exec 1>&2

# Check for TODO comments
if ! git diff-index --cached --quiet $against -- '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' '**/*.html' '**/*.css' '**/*.scss' '**/*.md' '(exclude)package-lock.json' '(exclude)yarn.lock'; then
    echo "To be committed:"
    git diff --cached -- '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' '**/*.html' '**/*.css' '**/*.scss' '**/*.md' '(exclude)package-lock.json' '(exclude)yarn.lock'
    if git diff --cached --name-only -z $against | xargs -0 grep -n 'TODO'; then
        echo 'ERROR: Commit contains TODO'
        exit 1
    fi
fi

# Normal exit
exit 0
