#!/usr/bin/env sh

# Abort deployment execution on any subsequent errors
set -e

# Compile raw source code into optimized distribution assets
npm run build

# Navigate into the generated output folder
cd dist

# Initialize temporary repository and push static distribution bundles to GitHub
git init
git add -A
git commit -m 'New deployment sync setup'

# FORCE PUSH directly to the gh-pages hosting branch
git push -f git@github.com:ProfessorJayBird/module11.git master:gh-pages

cd -
