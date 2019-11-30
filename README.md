# bochsbuild

[![Build Status](https://dev.azure.com/yrp604/bochsbuild/_apis/build/status/yrp604.bochsbuild?branchName=master)](https://dev.azure.com/yrp604/bochsbuild/_build/latest?definitionId=2&branchName=master)
[![Build Status](https://dev.azure.com/yrp604/bochsbuild/_apis/build/status/yrp604.bochsbuild?branchName=bochshead)](https://dev.azure.com/yrp604/bochsbuild/_build/latest?definitionId=2&branchName=bochshead)


This is a build job for the bochs artifacts for bochscpu.

## Build

Requires subversion, git, and a C compiler

### Linux/macOS

```
$ sh prep.sh
$ cd bochs
$ sh .conf.cpu
$ nmake
```

### Windows

From WSL/Cygwin

```
$ sh prep.sh
$ cd bochs
$ sh .conf.cpu-msvc
```

From VS x64 command prompt
```
> cd bochs
> nmake
> cd fpu
> nmake
```

## Artifacts

This will build the following files:
- `bochs/cpu/libcpu.a`
- `bochs/cpu/fpu/libfpu.a`
- `bochs/cpu/avx/libavx.a`
- `bochs/cpu/cpudb/libcpudb.a`
