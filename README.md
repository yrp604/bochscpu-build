# bochscpu-build

|Branch|Status|
|------|------|
|main|![Build](https://github.com/yrp604/bochscpu-build/actions/workflows/build.yml/badge.svg)|
|3.0|![Build](https://github.com/yrp604/bochscpu-build/actions/workflows/build.yml/badge.svg?branch=3.0)|
|2.8|![Build](https://github.com/yrp604/bochscpu-build/actions/workflows/build.yml/badge.svg?branch=2.8)|
|2.7|![Build](https://github.com/yrp604/bochscpu-build/actions/workflows/build.yml/badge.svg?branch=2.7)|

This is a build job for the bochs artifacts for bochscpu. For normal usage you
should only need to download a recent release, not build from source yourself.

## Build

Requires git and a C compiler

NOTES:
- by design the build will fail with an error about libinstrument. This is
expected and fine.

### Linux/macOS

```
$ sh prep.sh
$ cd Bochs/bochs
$ sh .conf.cpu
$ make
```

### Windows

From WSL/Cygwin

```
$ sh prep.sh
$ cd Bochs/bochs
$ sh .conf.cpu-msvc
```

From a Visual Studio x64 command prompt
```
> cd Bochs\bochs
> nmake
```

## Artifacts

This will build the following files:
- `Bochs/bochs/cpu/libcpu.a`
- `Bochs/bochs/cpu/fpu/libfpu.a`
- `Bochs/bochs/cpu/avx/libavx.a`
- `Bochs/bochs/cpu/cpudb/libcpudb.a`
- `Bochs/bochs` source tree

These needs to wind up in a directory tree like this:
```
x@y:~/bochscpu$ tree bochs
bochs/
└── [... snip many c files here ...]
x@y:~/bochscpu$ tree lib
lib
├── avx.lib
├── cpudb.lib
├── cpu.lib
└── fpu.lib
```

On Windows these files will be named `object.lib`, on linux/macos they will
`libobject.a`. This is done by default by the pipeline script, and you should
be able to simply copy the precompiled artifacts into your `bochscpu` source
tree.
