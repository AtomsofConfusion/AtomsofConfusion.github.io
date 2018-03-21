---
layout: page
title: Atoms in the Wild
permalink: /2017-atom-finder/
tags: atom-finder
---

<div class="toc">
  <h4 class="toc-title">Materials</h4>
  <ul>
    <li><a href="{{site.paper_url.atom_finder}}">Paper</a></li>
    <li><a href="https://github.com/dgopstein/atom-finder">Codebase</a></li>
    <li><a href="https://github.com/dgopstein/atom-finder/tree/master/src/atom_finder/classifier"> Classifiers</a></li>
    <li><a href="/2017-atom-finder/validation">Validation Examples</a></li>
    <li><a href="https://github.com/dgopstein/atom-finder/tree/master/src/analysis/data">Mined Data</a></li>
  </ul>
</div>

Atoms of confusion have been shown to cause confusion in programmers
what remains to be shown is how prevalent these patterns are in real
production software. This project attempts to answer that question.

We have written [classifiers](https://github.com/dgopstein/atom-finder/tree/master/src/atom_finder/classifier)
that can identify which parts of a C program contain atoms of confusion.

<br />

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

<br />

#### Datasets Mined from our Corpus

Most every graphic in our paper is generated from a uniquely-tailored dataset
mined from our corpus. The majority of these datasets are available in our
source repository
[here](https://github.com/dgopstein/atom-finder/tree/master/src/analysis/data).


Some data is quite accessible directly, for example the file
[atom_counts.csv](https://github.com/dgopstein/atom-finder/blob/master/src/analysis/data/atom_counts.csv)
shows the total number of atoms of each type in each of our corpus projects. It is
only 15 rows long, and 18 columns wide:

<style>
.tab-atom-counts {
  table-layout: fixed;
  width: 100%;
}
.tab-atom-counts tbody{
   display: block;
   overflow: scroll;
}
</style>

{: .tab-atom-counts}
Project | All Nodes | Non Atoms | Operator Precedence | Omitted Curly Braces | Implicit Predicate | Conditional | Preprocessor In Statement | Logic As Control Flow | Post Increment | Repurposed Variable | Assignment As Value | Comma Operator | Pre Increment | Type Conversion | Literal Encoding | Macro Operator Precedence | Reversed Subscript
linux | 78757141 | 77439581 | 555452 | 570565 | 143299 | 53874 | 40085 | 33862 | 23461 | 21381 | 17527 | 8325 | 5500 | 3201 | 2675 | 494 | 0
freebsd | 76779090 | 75741579 | 256235 | 528778 | 72499 | 58481 | 92179 | 73127 | 25459 | 24270 | 43904 | 33037 | 8312 | 2568 | 1710 | 1359 | 2
gecko-dev | 43274783 | 42930794 | 115529 | 122117 | 13134 | 29027 | 37237 | 37911 | 12663 | 10956 | 13168 | 15557 | 2858 | 2363 | 1377 | 1133 | 0
gcc | 33466986 | 32929723 | 110741 | 215568 | 128546 | 79764 | 4964 | 38819 | 10478 | 14243 | 8170 | 8516 | 2197 | 9609 | 1358 | 19 | 32
webkit | 15081419 | 14937775 | 35688 | 71575 | 5347 | 10172 | 13859 | 17070 | 2649 | 2877 | 2398 | 4105 | 1218 | 688 | 276 | 362 | 4
mongo | 12635600 | 12538099 | 21474 | 47775 | 1953 | 6775 | 2291 | 11166 | 3409 | 2797 | 4584 | 3135 | 2418 | 284 | 192 | 87 | 0
clang | 10177857 | 10006694 | 43234 | 69303 | 37182 | 31703 | 1253 | 11921 | 748 | 2197 | 1431 | 2105 | 4535 | 1306 | 20 | 61 | 15
mysql-server | 9840835 | 9737142 | 24025 | 45514 | 6398 | 6931 | 2193 | 9227 | 4290 | 1941 | 8568 | 5025 | 964 | 475 | 140 | 395 | 0
subversion | 2717036 | 2693808 | 4529 | 14615 | 414 | 1915 | 995 | 1350 | 322 | 287 | 465 | 100 | 87 | 7 | 12 | 19 | 0
emacs | 1359693 | 1330562 | 6648 | 13892 | 1824 | 2070 | 429 | 2989 | 1461 | 984 | 1298 | 1250 | 238 | 388 | 209 | 1 | 0
git | 1205550 | 1177705 | 6611 | 15727 | 2798 | 1291 | 192 | 1937 | 759 | 612 | 835 | 217 | 224 | 8 | 0 | 27 | 0
httpd | 1027265 | 1016524 | 2947 | 2272 | 1408 | 1304 | 988 | 1332 | 607 | 120 | 1496 | 148 | 128 | 234 | 0 | 51 | 0
nginx | 730659 | 726250 | 3485 | 1 | 50 | 309 | 17 | 236 | 641 | 150 | 28 | 63 | 81 | 0 | 0 | 0 | 0
vim | 644955 | 630928 | 2683 | 7857 | 1328 | 662 | 253 | 1198 | 946 | 342 | 467 | 69 | 177 | 10 | 4 | 0


<br />

Some data, on the other hand, is better suited for programmatic consumption. For
example,
[atoms-in-bugs_gcc_2018-01-11_added.csv.bz2](https://github.com/dgopstein/atom-finder/blob/master/src/analysis/data/atoms-in-bugs_gcc_2018-01-11_added.csv.bz2),
describes the number of atoms added in each file committed to GCC across its
entire history. It spans almost 800k lines and 10mb after bz2 compression. These
are the first few lines:

<style>
.tab-atoms-in-bugs {
  table-layout: fixed;
  width: 100%;
}
.tab-atoms-in-bugs tbody{
   display: block;
   overflow: scroll;
}
</style>

{: .tab-atoms-in-bugs}
Author Name|Author Email|File|# Bugs|Added Non Atoms|# Nodes Added|Rev Str|Removed Non Atoms|# Nodes Removed|Preprocessor In Statement|Logic As Control Flow|Conditional|Reversed Subscript|Literal Encoding|Post Increment|Pre Increment|Comma Operator|Omitted Curly Braces|Assignment As Value|Macro Operator Precedence|Operator Precedence|Repurposed Variable|Implicit Predicate|Type Conversion
rguenth|rguenth@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/ChangeLog|0|3|3|2201c33012d4c6dc522ddbfa97f5aa95a209e24d|0|0|||||||||||||||
rguenth|rguenth@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/tree-ssa-pre.c|0|2|2|2201c33012d4c6dc522ddbfa97f5aa95a209e24d|4160|4233|||||||||||||||
rguenth|rguenth@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/tree-ssa-sccvn.c|0|4151|4225|2201c33012d4c6dc522ddbfa97f5aa95a209e24d|0|0||1|1||||||53|2||16||1|
rguenth|rguenth@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/tree-ssa-sccvn.h|0|9|9|2201c33012d4c6dc522ddbfa97f5aa95a209e24d|0|0|||||||||||||||
rguenth|rguenth@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/testsuite/ChangeLog|1|3|3|476ea17a1752df3ca32ae996e3c88f42f00ecc3a|0|0|||||||||||||||
paolo|paolo@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/testsuite/ChangeLog|1|3|3|39a925e789721936cf9ed74153a2b375ee504ec9|0|0|||||||||||||||
vries|vries@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/testsuite/ChangeLog|0|3|3|1ddd2233adfc059bfb2982a0a5f5dadeb723ec46|0|0|||||||||||||||
vries|vries@138bc75d-0d04-0410-961f-82ee72b054a4|gcc/testsuite/gcc.dg/tree-ssa/loop-1.c|0|1|1|1ddd2233adfc059bfb2982a0a5f5dadeb723ec46|0|0|||||||||||||||
