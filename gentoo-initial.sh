#!/bin/zsh
set -e

pkgs=(
    #
    # Python
    #
    dev-lang/python
    dev-python/pip
    dev-python/psycopg

    #
    # Java, Clojure, Kotlin
    #
    dev-java/openjdk-bin
    dev-java/gradle-bin
    dev-lang/clojure
    dev-java/leiningen-bin

    dev-util/bazel
    # kotlin - not available?
    # ktlint - not available?

    #
    # Ruby
    #
    dev-lang/ruby

    #
    # Rust 
    #
    dev-util/rustup

    #
    # Go
    #
    dev-lang/go

    #
    # Node.js
    #
    net-libs/nodejs

    #
    # Haskell
    #
    dev-haskell/stack

    #
    # OCaml / ReasonML
    #
    dev-ml/opam

    #
    # C, C++
    #
    sys-devel/autoconf
    sys-devel/automake
    sys-devel/libtool
    dev-util/cmake
    # binaryen - not existing
    dev-util/ninja
    dev-util/ccls

    #
    # Lua
    #
    dev-lang/luajit

    #
    # Perl
    #
    dev-lang/perl

    #
    # Prolog
    #
    dev-lang/swi-prolog

    #
    # R
    #
    dev-lang/R

    #
    # Cloud tools
    #
    # kubeval - not exists
    app-admin/terraform
    sys-cluster/k9scli
    # kubespy - not exists
    # lazydocker n/a
    # skaffold n/a
    sys-cluster/kubectl
    app-admin/helm
    # kubetail - n/a
    # google-cloud-sdk - n/a
    app-admin/ansible
    app-admin/awscli
    sys-process/ctop
    net-dns/dnsmasq
    app-containers/podman

    


    #
    # Editors
    #
    app-editors/emacs

    #
    # Chat
    #
    net-irc/weechat

    #
    # Git stuff
    #
    dev-vcs/git
    # no git-secret :(
    dev-vcs/git-lfs

    #
    # Stuff
    #
    # act n/a
    sys-apps/bat
    dev-util/bats
    sci-mathematics/calc
    app-misc/yq
    app-misc/jq


    #
    # CTF tools
    #
)

emerge $pkgs
