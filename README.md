# Git Commit SHA App

A C# application that prints the git commit SHA it was built with. The Docker image is tagged with the same commit SHA for traceability.

## Prerequisites

- .NET 8 SDK
- Docker (optional, for container builds)

## Standalone Build & Run

```bash
dotnet build
dotnet run
```

The git commit SHA is automatically embedded at compile time.

## Docker Build

```bash
./build.sh
```

This will:
1. Get the current git commit SHA
2. Build the Docker image with the SHA embedded
3. Tag the image as `gitcommitapp:<short-sha>` and `gitcommitapp:latest`

```bash
docker run gitcommitapp:<short-sha>
```

## Output

```
Git Commit SHA: <full-sha>
```

## GitLab CI/CD

The included `.gitlab-ci.yml` automatically builds and pushes the Docker image to GitLab Container Registry on commits to the default branch.

Images are tagged with:
- `$CI_REGISTRY_IMAGE:<short-sha>`
- `$CI_REGISTRY_IMAGE:latest`

## Branches

| Branch | Description |
|--------|-------------|
| `main` | Compile-time approach - SHA embedded via MSBuild (recommended) |
| `runtime-env-var` | Runtime approach - SHA passed via environment variable |

## Project Structure

| File | Description |
|------|-------------|
| `Program.cs` | Application entry point |
| `GitCommitApp.csproj` | .NET project file with MSBuild target for SHA |
| `Dockerfile` | Multi-stage Docker build |
| `build.sh` | Local build script |
| `.gitlab-ci.yml` | GitLab CI/CD pipeline |
