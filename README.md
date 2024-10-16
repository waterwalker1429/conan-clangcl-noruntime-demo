# How to reproduce conan AutoTools GnuDepsFlags issue with clang-cl:

## Setup the build container
- git clone https://github.com/waterwalker1429/conan-clangcl-noruntime-demo.git
- docker build conan-clangcl-noruntime-demo -t clangcl-example-container
- docker run -it -v /conan-clangcl-noruntime-demo:/workspace/example clangcl-example-container /bin/bash

## Reproduce the issue inside the build container
- /opt/conan/bin/conan create /workspace/example/dependency -pr:b /workspace/example/build -pr:h /workspace/example/clang-cl
- /opt/conan/bin/conan create /workspace/example/autotools -pr:b /workspace/example/build -pr:h /workspace/example/clang-cl
- cat /root/.conan2/p/b/mypkg<...>/b/build-debug/conan/conanautotoolsdeps.sh

### Actual result
- generated LDFLAGS are gnu compatible (i.e. -L...)

### Expected result
- generated LDFLAGS should be clang-cl compatible (i.e. /libpath:...)

### Note
- the same observation can be made for further exported flags
```
export CPPFLAGS="$CPPFLAGS -I/root/.conan2/p/b/depen3cb7e3c0d68dd/p/include"
export LIBS="$LIBS -ldependency"
```
