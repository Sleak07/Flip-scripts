#!/bin/bash

# Fetch all branches
git fetch --all

# Checkout master and pull the latest changes
git checkout master
git pull origin master

# List of branches to merge
branches=("python" "rust")

# Loop through each branch and merge it into master
for branch in "${branches[@]}"; do
  git checkout $branch
  git pull origin $branch
  git checkout master
  git merge $branch

  if [ $? -ne 0 ]; then
    echo "Merge conflict in branch $branch. Please resolve and commit."
    exit 1
  fi
done

# Push the updated master branch
git push origin master

