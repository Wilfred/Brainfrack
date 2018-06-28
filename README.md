# Brainfrack

[![Build Status](https://travis-ci.org/Wilfred/Brainfrack.svg?branch=master)](https://travis-ci.org/Wilfred/Brainfrack)

A collection of [BF](http://en.wikipedia.org/wiki/Brainfuck)
interpreters in different languages. GPLv2 or later license.

Implementing BF is a great way of exploring unfamiliar programming
languages. There's non-trivial logic, some I/O, and multiple
data types. BF is still small enough that you can build a complete
implementation in an evening or two.

For a robust, high performance BF implementation with good user
feedback, see my
['industrial-grade' BF compiler](https://github.com/wilfred/bfc).

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Brainfrack](#brainfrack)
    - [Java](#java)
        - [Compiling](#compiling)
        - [Usage](#usage)
    - [Haskell](#haskell)
    - [Clojure](#clojure)
    - [C](#c)
    - [Test programs](#test-programs)

<!-- markdown-toc end -->

## Java

### Compiling

Apache Maven required.

    $ cd java/brainfrack
    $ mvn package

### Usage

The Java implementation reads programs from standard in.

    $ cat ../../sample_programs/hello_world.bf | java -cp target/brainfrack-0.1.jar com.github.wilfred.App
    Hello world!

## Haskell

The Haskell implementation reads programs from standard in.

    $ cd haskell
    $ ghc Brainfrack.hs
    $ cat ../sample_programs/hello_world.bf | ./Brainfrack

## Clojure

The Clojure implementation reads programs from standard in.

    $ cd clojure/brainfrack
    $ lein compile
    $ cat ../../sample_programs/hello_world.bf | lein trampoline run

## C

The C implementation reads programs from standard in.

    $ cd c
    $ make
    $ cat ../sample_programs/hello_world.bf | ./brainfrack

## Racket

    $ cd racket
    $ cat ../sample_programs/hello_world.bf | racket brainfrack.rkt

## OCaml

    $ cd ocaml
    $ ocamlbuild brainfrack.native
    $ cat ../sample_programs/hello_world.bf| ./brainfrack.native

## Test programs

http://www.hevanet.com/cristofd/brainfuck/tests.b is a treasure trove
of implementation tests. Most implementations here don't pass all
these tests yet.
