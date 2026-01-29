FROM ubuntu:22.04 AS build

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install conan
RUN conan profile detect

WORKDIR /src
COPY conanfile.txt CMakeLists.txt main.cpp version.h.in ./

ARG GIT_COMMIT_SHA=unknown

RUN conan install . --output-folder=build --build=missing
RUN cmake -B build -DCMAKE_TOOLCHAIN_FILE=build/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release -DGIT_COMMIT_SHA=${GIT_COMMIT_SHA}
RUN cmake --build build

FROM ubuntu:22.04
COPY --from=build /src/build/gitcommitapp /usr/local/bin/
ENTRYPOINT ["gitcommitapp"]
