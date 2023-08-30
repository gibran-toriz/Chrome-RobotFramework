## Docker Build

docker build -t gib0tdc/chrome-robotframework:tag .

## Docker Run

docker run -d -p 5900:5900 -p 5901:5901 \
    -v $(pwd)/selenium:/home/apps/selenium \
    -v $(pwd)/trigger_service:/home/apps/trigger_service \
    -e VNC_SERVER_PASSWORD=some-password --name selenium_robot \
    --user apps --privileged gib0tdc/chrome-robotframework:tag


## Invoke Trriger Service

curl --location 'http://localhost:5901/selenium/start' \
--header 'Content-Type: application/json' \
--data '{"message":"c29tZS1hcGlrZXk="}'

