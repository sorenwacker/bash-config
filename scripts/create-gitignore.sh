echo """
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

.localhistory
.ipynb_checkpoints
.*.ipynb
.pytest_cache
*egg-info*
__pycache__
.*
devel
output
build
dist
site
htmlcov
Untitled*.ipynb
nohup.out 
.env

# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*


""" >> .gitignore
