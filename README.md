Run with Docker  

docker run -it -p 8080:7090 -v $(pwd):/app -w "/app" mcr.microsoft.com/dotnet/sdk:6.0 /bin/bash

