#!/bin/bash

# We cannot be in a Drupal directory to run aliased drush commands.
cd $HOME 
pwd
echo $HOME

# Make a Drupal installation to run the tests
drush --yes make ./drupal-7.make $BUILD_DIR
mkdir -p $BUILD_DIR/$MODULE_PATH
cd $BUILD_DIR 
pwd

# - git archive $(git rev-parse --abbrev-ref HEAD) | tar -x -C $MODULE_PATH
# Install Drupal
drush --yes site-install minimal --db-url="$DATABASE_URL" 
drush --yes en simpletest
