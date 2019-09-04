FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

COPY . ./
RUN dotnet clean
RUN dotnet publish -o out -v Detailed

FROM microsoft/dotnet:2.2.1-aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "ws-1044.dll"]