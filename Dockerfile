# Use the official Debian bookworm base image
FROM debian:bookworm

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    cmake \
    ninja-build \
    python3 \
    python3-pip \
    python3.11-venv \
    git \
    curl \
    wget \
    gnupg \
    software-properties-common && \
    rm -rf /var/lib/apt/lists/*

# Add the LLVM repository
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    add-apt-repository "deb http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm main" && \
    apt-get update && \
    apt-get install -y clang-14 lld-14 && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/lib/llvm-14/bin/clang /usr/bin/clang-cl &&  \
    for f in /usr/lib/llvm-14/bin/clang*; do update-alternatives --install /usr/bin/$(basename $f) $(basename $f) $f 100; done && \
    for f in /usr/lib/llvm-14/bin/llvm*; do update-alternatives --install /usr/bin/$(basename $f) $(basename $f) $f 100; done && \
    for f in /usr/lib/llvm-14/bin/lld*; do update-alternatives --install /usr/bin/$(basename $f) $(basename $f) $f 100; done


# Create a virtual environment and install Conan
RUN python3 -m venv /opt/conan && \
    /opt/conan/bin/pip install conan==2.7.0

# Set clang as the default compiler
ENV CC=clang-cl
ENV CXX=clang-cl

# Set the working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]

