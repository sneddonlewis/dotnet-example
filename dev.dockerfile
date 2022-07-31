FROM mcr.microsoft.com/dotnet/sdk:6.0

LABEL author="Lewis Sneddon"

ENV ASPNETCORE_URLS=http://*:7090
ENV DOTNET_USEPOLLING_FILE_WATCHER=1
ENV ASPNETCORE_ENVIRONMENT=development

WORKDIR /app

ENTRYPOINT ["/bin/bash", "-c", "dotnet restore && dotnet watch run"]