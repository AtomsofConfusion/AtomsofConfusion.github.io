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
    <li><a href="{{site.paper_url.atom_finder}}">Paper</a></li>
    <li><a href="/2017-atom-finder/validation">Validation Examples</a></li>
  </ul>
</div>

Atoms of confusion have been shown to cause confusion in programmers
what remains to be shown is how prevalent these patterns are in real
production software. This project attempts to answer that question.

We have written [classifiers](https://github.com/dgopstein/atom-finder/tree/master/src/atom_finder/classifier)
that can identify which parts of a C program contain atoms of confusion.

#### Corpus

All of our experiments are performed on a set of 14 large and popular open
source projects.

<style>
.tab-corpus {
  table-layout: auto;
}
</style>

{: .tab-corpus}
  Project    |  Domain           | Creation |    KLOC | Revision
  ---------- |  ----------       | :-------: | ------: | -------
  Linux      |  Operating System |  1991    |  22641  | [f341578](https://github.com/torvalds/linux/tree/f34157878d3b17641ad2366988600c23c89d98b2    )
  FreeBSD    |  Operating System |  1993    |  20496  | [c2b6ea8](https://github.com/freebsd/freebsd/tree/c2b6ea8fa56ce6aba773d820fbf64a4d3efac9f5   )
  Gecko      |  Browser Renderer |  1998    |  15170  | [dd47bee](https://github.com/mozilla/gecko-dev/tree/dd47bee6468de7e1221b4d006342ad6b9813d0e5 )
  WebKit     |  Browser Renderer |  2001    |   8216  | [e8c7320](https://github.com/WebKit/webkit/tree/e8c73206a09f734bc64f77d6275a727aa2811754     )
  GCC        |  Compiler Suite   |  1988    |   5488  | [2201c33](https://github.com/gcc-mirror/gcc/tree/2201c33012d4c6dc522ddbfa97f5aa95a209e24d    )
  Clang      |  Compiler Suite   |  2007    |   2001  | [2bcd2d0](https://github.com/llvm-mirror/clang/tree/2bcd2d052e5508c12374390e4a2d572988622caf )
  MongoDB    |  Database         |  2007    |   3872  | [67f735e](https://github.com/mongodb/mongo/tree/67f735e6705091659e2a8cf46a9285f09bcf749a     )
  MySQL      |  Database         |  2000    |   2990  | [0138556](https://github.com/mysql/mysql-server/tree/0138556a55168da12eaf0bc3038947148d6b0863)
  Subversion |  Version Control  |  2000    |    720  | [0a73cab](https://github.com/apache/subversion/tree/0a73cab17bd4114d1ce96dc5b89b0e44ec0fd5d1 )
  Git        |  Version Control  |  2005    |    253  | [ba78f39](https://github.com/git/git/tree/ba78f398be65e941b93276680f68a81075716472           )
  Emacs      |  Text Editor      |  1985    |    484  | [cb73c70](https://github.com/emacs-mirror/emacs/tree/cb73c70180f57f3fb99fae3aaefbacf0a61cea3f)
  Vim        |  Text Editor      |  1991    |    459  | [6ce6504](https://github.com/vim/vim/tree/6ce650480844bfaa5410874416b4a2e15f40b870           )
  Httpd      |  Webserver        |  1996    |    637  | [6fe2348](https://github.com/apache/httpd/tree/6fe234860d15c797f34bc9c0e290fd23a73233c7      )
  Nginx      |  Webserver        |  2002    |    187  | [9cb9ce7](https://github.com/nginx/nginx/tree/9cb9ce78b1d81ccdbcd123ccc3dab295b836a174       )
  

<br />

#### Validation Examples

To make our sure our classifiers were capturing patterns that represented atoms
of confusion, we hand validated some positively flagged AST nodes. We randomly
selected (up to) 40 examples for each of our classifiers. While we only
hand-evaluated the first 20 of each, all examples are included below.

* [Assignment as Value](/2017-atom-finder/validation#assignment-as-value)
* [Comma Operator](/2017-atom-finder/validation#comma-operator)
* [Conditional Operator](/2017-atom-finder/validation#conditional)
* [Implicit Predicate](/2017-atom-finder/validation#implicit-predicate)
* [Literal Encoding](/2017-atom-finder/validation#literal-encoding)
* [Logic as Control Flow](/2017-atom-finder/validation#logic-as-control-flow)
* [Macro Operator Precedence](/2017-atom-finder/validation#macro-operator-precedence)
* [Omitted Curly Brace](/2017-atom-finder/validation#omitted-curly-braces)
* [Operator Precedence](/2017-atom-finder/validation#operator-precedence)
* [Post-Increment](/2017-atom-finder/validation#post-increment)
* [Pre-Increment](/2017-atom-finder/validation#pre-increment)
* [Preprocessor in Statement](/2017-atom-finder/validation#preprocessor-in-statement)
* [Repurposed Variable](/2017-atom-finder/validation#repurposed-variable)
* [Reversed Subscript](/2017-atom-finder/validation#reversed-subscript)
* [Type Conversion](/2017-atom-finder/validation#type-conversion)
