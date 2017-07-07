---
layout: page
title: Atoms in the Wild
permalink: /2017-atom-finder/
tags: atom-finder
---

<div class="toc">
  <h4 class="toc-title">Materials</h4>
  <ul>
    <li><a href="https://github.com/dgopstein/atom-finder">Codebase</a></li>
  </ul>
</div>

Atoms of confusion have been shown to cause confusion in programmers
what remains to be shown is how prevalent these patterns are in real
production software. This project attempts to answer that question.

We have written [classifiers](https://github.com/dgopstein/atom-finder/tree/master/src/atom_finder/classifier)
that can identify which parts of a C program contain atoms of confusion.

Running these classifiers over the source code of the Linux kernel
we've found the following numbers of atoms in the wild:

| Atom                      | # Occurrences in Linux |
| omitted-curly-braces      | 520079 |
| macro-operator-precedence | 149754 |
| conditional               | 49175  |
| preprocessor-in-statement | 33567  |
| logic-as-control-flow     | 31065  |
| post-increment            | 21750  |
| assignment-as-value       | 17071  |
| comma-operator            | 7436   |
| literal-encoding          | 5890   |
| reversed-subscript        | 0      |
