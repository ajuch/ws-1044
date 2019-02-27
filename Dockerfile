FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /app

COPY . ./

RUN dotnet publish -o out

FROM microsoft/dotnet:2.2.1-aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "ws-1044.dll"]