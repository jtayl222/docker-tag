FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG GIT_COMMIT_SHA=unknown
WORKDIR /src
COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o /app -p:GitCommitSha=$GIT_COMMIT_SHA

FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "GitCommitApp.dll"]
