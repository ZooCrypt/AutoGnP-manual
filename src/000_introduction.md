<p class="halfbreak">
</p>

Introduction
============

In this book, you will learn how to construct cryptographic proofs
using the $\autognp$ tool. The $\autognp$ tool is designed to perform
(mostly) automated proofs of pairing-based cryptographic constructions
in both the random oracle model and the standard model.

**FIXME**: Describe scope of $\autognp$ and list larger examples.
Compare to other tools for computational proofs like $\easycrypt$ and
$\cryptoverif$ and tools for symbolic proofs like $\proverif$,
$\scyther$, and $\tamarin$.

Overview
--------

The book consists of four chapters, a bibliography, and an appendix
that contains the complete input files for all examples that occur
in the book.

[Chapter 1: Example](001_example.html):

: We use $\IndCpa$ security of El-Gamal encryption as an example
  to illustrate the concepts.
 
[Chapter 2: Specifying security experiments](002_specs.html):

: We explain the input language used by $\autognp$ to describe
  assumptions and security experiments.

[Chapter 3: Proving probability bounds](003_proving.html):

: We explain the tactic language used to perform proofs
of probability bounds.

[Chapter 4: Advanced techniques](004_advanced.html):

: We explain more advanced proof techniques like hybrid arguments.

Prerequisites
-------------

The book deals with the following topics:

* Game-based cryptographic definitions and proofs
* Machine-checked interactive proofs
* Bilinear groups as used in cryptography

We try to minimize the required knowledge and expect the reader to fill
in the gaps along the way. Usually, knowledge in either game-based
cryptographic proofs or in formal methods should be
sufficient to follow. For newcomers to all three topics, it might
be hard to follow along without following the pointers to additional
material.

Acknowledgements
----------------

This book is built using [pandoc](http://www.pandoc.org) and the setup
and templates are based on Stephen Diehl's book [Write you a
Haskell](http://somewhere.org) and the [Rust
book](http://www.rustlang.org).

Installation
------------

Detailed installation instructions can be found on the
project webpage in the file [README.md](http://www.github.com/zoocrypt/AutoGnP).