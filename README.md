# bochscpu-build

|Branch|Status|
|------|------|
|master|[![Build Status](https://dev.azure.com/yrp604/bochscpu-build/_apis/build/status/yrp604.bochscpu-build?branchName=master)](https://dev.azure.com/yrp604/bochscpu-build/_build/latest?definitionId=2&branchName=master)|
|bochshead|[![Build Status](https://dev.azure.com/yrp604/bochscpu-build/_apis/build/status/yrp604.bochscpu-build?branchName=bochshead)](https://dev.azure.com/yrp604/bochscpu-build/_build/latest?definitionId=2&branchName=bochshead)|


This is a build job for the bochs artifacts for bochscpu. For normal usage you
should only need to download a recent release, not build from source yourself.

## Build

Requires subversion, git, and a C compiler

NOTES:
- by design the build will fail with an error about libinstrument. This is
expected and fine.

### Linux/macOS

```
$ sh prep.sh
$ cd Bochs\bochs
$ sh .conf.cpu
$ make
```

### Windows

From WSL/Cygwin

```
$ sh prep.sh
$ cd Bochs\bochs
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
