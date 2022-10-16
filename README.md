# Tools for [Hugo](https://gohugo.io/)  

Simple scirpts for:
  
  1. `run.sh` - to local run website wriiten in Hugo by [docker image](https://hub.docker.com/r/klakegg/hugo/)
  2. `build.sh` - to build website
  3. `deploy.sh` - deploy built website to AWS S3 and clean cloudfront by aws cli
  4. `install-theme.sh` - fetch git repository with [hugo themes](https://themes.gohugo.io/)

## Config

Copy config.example to config

 `THEME_REPO` - git repository with hugo theme
 `THEME_VERSION` - version of theme should be tag or branch
 `HUGO_IMAGE` - "klakegg/hugo:0.101.0-ext" [images in dockher hub](https://hub.docker.com/r/klakegg/hugo/)  
 `S3_BUCKET` -  for deploymnet name of AWS S3 bucket
 `CLOUDFRONT_DISITRIBUTION_ID` - for deployment id of cloudfront
 