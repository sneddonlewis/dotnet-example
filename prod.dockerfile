FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["app.csproj", "./"]
RUN dotnet restore "./app.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "app.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "app.csproj" -c Release -o /app

FROM base AS final
ENV ASPNETCORE_URLS=http://*:7090
EXPOSE 5000
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "app.dll"]