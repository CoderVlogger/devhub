# DevHub

[![Build Status](https://travis-ci.org/CoderVlogger/devhub.svg?branch=master)](https://travis-ci.org/CoderVlogger/devhub)

> Goal: using automated tools (robots) gather most recent and most valuable technical articles and posts from popular websites, engineering blogs, etc.

This repositoroy is a monorepo which includes:

- devhub-be/devhub - back-end, Golang project
- devhub-fe-web - front-end web, React project
- devhub-fe-mobile - front-end mobile, React Native/Expo project

## Structure

```
devhub:                 # git root directory
    devhub-be             # container for back-end
        devhub              # go project
    devhub-fe-web         # container for front-end web
        devhub              # react project
    devhub-fe-mobile      # container for front-end mobile
        devhub              # expo/react native project
```
