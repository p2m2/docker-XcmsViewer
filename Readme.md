# XcmsViewer dockerized version

The code available here is adapted from https://github.com/mengchen18/xcmsViewer

## Run
To run XcmsView in docker, first build the Docker image with Docker installed on the system,

```docker build . -t xcmsv```


Then put the data to be viewed in the local directoryand run :

```docker run -p 3838:3838 -v .:/home/shiny/data  xcmsv```

Finally open localhost:3838 in your browser, log in with password "metabohub" 


## Password
The default web page password is "metabohub", it can be changed in landingPage.R, line 32.

## Port and address
Port and address can be changed with environment variables :

```docker run --env HOST="127.0.0.1" --env PORT=3737 -p 3737:3737 -v .:/home/shiny/data xcmsv```

## Change data directory
XcmsViewer retrieves its data from /home/shiny/data inside the docker container, so it is possible to specify the local data directory by changing the docker volume setting.
For example, to use /data as data dir on the host :

```docker run -p 3838:3838 -v /data:/home/shiny/data  xcmsv```


