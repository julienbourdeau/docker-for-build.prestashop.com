#!/bin/bash

alias build="bundle exec jekyll serve -H 0.0.0.0"
sudo -H -u developer bash -c 'bower install'

bundle update

bundle exec jekyll serve -H 0.0.0.0

/bin/bash
