# Git Commit SHA App

Applications that print the git commit SHA they were built with. Docker images are tagged with the same commit SHA for traceability.

## Implementations

| Folder | Language | Build System |
|--------|----------|--------------|
| `csharp/` | C# (.NET 8) | MSBuild |
| `cpp/` | C++ | CMake + Conan |

## C# Version

### Prerequisites
- .NET 8 SDK
- Docker (optional)

### Standalone
```bash
cd csharp
dotnet build
dotnet run
```

### Docker
```bash
cd csharp
./build-local-docker.sh
docker run gitcommitapp:<short-sha>
```

## C++ Version

### Prerequisites
- CMake 3.15+
- Conan 2.x
- Docker (optional)

### Standalone
```bash
cd cpp
conan install . --output-folder=build --build=missing
cmake -B build -DCMAKE_TOOLCHAIN_FILE=build/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build build
./build/gitcommitapp
```

### Docker
```bash
cd cpp
./build-local-docker.sh
docker run gitcommitapp-cpp:<short-sha>
```

## Output

```
Git Commit SHA: <full-sha>
```

## GitLab CI/CD

Each folder has its own `.gitlab-ci.yml` that builds and pushes to GitLab Container Registry.

## Branches

| Branch | Description |
|--------|-------------|
| `main` | Compile-time SHA embedding (recommended) |
| `runtime-env-var` | Runtime SHA via environment variable (C# only) |
