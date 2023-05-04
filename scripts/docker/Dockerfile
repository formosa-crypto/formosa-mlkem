FROM debian:stable-slim

MAINTAINER Tiago Oliveira <tiago.oliveira@mpi-sp.org>

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=ches23

ARG EASYCRYPT_COMMIT=c299bbd5adb0d7e8f688a3fad94d3fa969e20baf
ARG JASMIN_COMMIT=97cb1e0efff1ac8bcaf7bc83a2444e95c4ec817f # github.com
ARG JASMIN_COMPILER_COMMIT=4bf5be4bd6a088fc2948e5c8bb32f9a90d6172c9 # corresponding extracted sources on gitlab.com (builds faster)

RUN apt-get -q -y update && apt-get -q -y upgrade && \
    apt-get -q -y install apt-utils sudo wget build-essential curl opam git m4 libgmp-dev libpcre3-dev pkg-config zlib1g-dev cvc4 vim gcc clang && \
    apt-get -q -y clean

RUN echo "%sudo  ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudoers && \
    chown root:root /etc/sudoers.d/sudoers && \
    chmod 0400 /etc/sudoers.d/sudoers && \
    useradd -ms /bin/bash -d /home/$USERNAME -g root -G sudo -u 1001 $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

RUN curl -L https://nixos.org/nix/install > nix-install && \
    sh nix-install && \
    (USER=$USERNAME; . /home/$USERNAME/.nix-profile/etc/profile.d/nix.sh) && \
    rm nix-install

ENV OPAMYES=true OPAMJOBS=8
ENV ALTERGO=2.4.2 Z3=4.8.14

RUN opam init --disable-sandboxing && \
    opam install depext

RUN opam pin add -n alt-ergo ${ALTERGO} && \
    opam depext alt-ergo && \
    opam install alt-ergo && \
    opam clean

RUN wget https://github.com/Z3Prover/z3/releases/download/z3-${Z3}/z3-${Z3}-x64-glibc-2.31.zip && \
    unzip -j z3-${Z3}-x64-glibc-2.31.zip z3-${Z3}-x64-glibc-2.31/bin/z3 && \
    sudo mv z3 /usr/local/bin/ && sudo chmod 755 /usr/local/bin/z3 && \
    rm -fr z3-${Z3}-x64-glibc-2.31.zip

RUN opam pin add -n easycrypt https://github.com/EasyCrypt/easycrypt.git#${EASYCRYPT_COMMIT} && \
    opam depext easycrypt && \
    opam install easycrypt && \
    opam clean

RUN opam config exec -- why3 config detect

RUN git clone https://gitlab.com/jasmin-lang/jasmin-compiler.git && \
    cd jasmin-compiler/ && \
    git checkout ${JASMIN_COMPILER_COMMIT}

RUN USER=$USERNAME; . /home/$USERNAME/.nix-profile/etc/profile.d/nix.sh && \
    cd jasmin-compiler/compiler && \
    nix-shell --command "make" && \
    sudo install -D jasminc /usr/local/bin/

RUN git clone https://github.com/jasmin-lang/jasmin.git && \
    cd jasmin/ && \
    git checkout ${JASMIN_COMMIT} && \
    mkdir -p /home/$USERNAME/.config/easycrypt/ && \
    echo "[general]\nidirs = Jasmin:/home/$USERNAME/jasmin/eclib" > /home/$USERNAME/.config/easycrypt/easycrypt.conf

RUN echo "eval $(opam env)" >> /home/$USERNAME/.bashrc

USER $USERNAME
RUN wget https://artifacts.formosa-crypto.org/data/hakyber.tar.bz2 && \
    tar -xf hakyber.tar.bz2 && \
    rm hakyber.tar.bz2

