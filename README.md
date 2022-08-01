Run with Docker  

docker run -it -p 8080:7090 -v $(pwd):/app -w "/app" mcr.microsoft.com/dotnet/sdk:6.0 /bin/bash

Build production image

docker build -f prod.dockerfile -t lsneddon/aspnetsite:1.0 .

Run image in daemon mode

docker run -d -p 8080:7090 lsneddon/aspnetsite:1.0

Build and run Dev image

docker build -f dev.dockerfile -t lsneddon/aspnetsite-dev:1.0 .

docker run -p 8080:7090 -v $(pwd):/app lsneddon/aspnetsite-dev:1.0
