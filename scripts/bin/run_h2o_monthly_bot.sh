#!/bin/bash

cp -a auth/. .
Rscript R/h2o_tweets_over_time.R
