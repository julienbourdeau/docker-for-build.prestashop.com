# docker-for-build.prestashop.com

Jekyll with bundler and bower. Custom made for http://build.prestashop.com

Docker Hub: https://registry.hub.docker.com/u/julienbourdeau/docker-for-prestashop-build/

## Getting started

1/ Clone the jekyll source into a `src` folder.
```bash
git clone https://github.com/PrestaShop/build.prestashop.com.git src
```

2/ Start the Docker container
```bash
docker run --rm -v "$PWD:/src" julienbourdeau/docker-for-prestashop-build
```
