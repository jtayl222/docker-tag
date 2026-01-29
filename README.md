# Git Commit SHA App

A C# application that prints the git commit SHA it was built with. The Docker image is tagged with the same commit SHA for traceability.

## Prerequisites

- .NET 8 SDK
- Docker

## Build & Run

### Docker (Recommended)

```bash
./build.sh
docker run gitcommitapp:<short-sha>
```

The build script:
1. Gets the current git commit SHA
2. Builds the Docker image with the SHA as an environment variable
3. Tags the image as `gitcommitapp:<short-sha>` and `gitcommitapp:latest`

### Standalone

```bash
GIT_COMMIT_SHA=$(git rev-parse HEAD) dotnet run
```

Note: The SHA must be passed as an environment variable for standalone runs.

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
| `main` | Runtime approach - SHA passed via environment variable |
| `compile-time-sha` | SHA embedded at compile time via MSBuild |

## Project Structure

| File | Description |
|------|-------------|
| `Program.cs` | Application entry point |
| `GitCommitApp.csproj` | .NET project file |
| `Dockerfile` | Multi-stage Docker build |
| `build.sh` | Local build script |
| `.gitlab-ci.yml` | GitLab CI/CD pipeline |
