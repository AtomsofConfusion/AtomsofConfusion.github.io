---
title: Atoms
layout: default
---


Today's software code is becoming larger and more complex, 
which makes it challenging for developers to comprehend.  As new programming 
languages keep emerging, and machine architectures continue 
to change, developers facing millions of lines of source code can easily 
misunderstand its meaning, or misjudge a
program's true output. When misunderstandings happen, program 
developers often end up creating flaws, bugs, or system vulnerabilities. These 
kinds of flaws are difficult to catch using traditional bug finding 
tools or via code review.

We propose that developers' misunderstandings about program code 
can be traced to certain fundamentally confusing pieces within the code 
itself. We demonstrate that these confusing pieces, named <b>atoms 
of confusion</b>, have distinct properties. The ability to identify and remove these 
atoms can help programmers avoid incidents caused by software flaws, and
improve both program comprehension and software maintenance. 
This work takes a first step towards rigorously understanding how developers
think about confusing pieces of code. Eventually, we will apply the results to 
build an expert system for both detecting comprehension-related bugs, and 
better educating future developers.

### Identified Atoms

We set out to compile an initial list of representative atoms to further
study their mechanisms. Rather than generate this list based solely on
intuition, we extracted our initial set of atoms from examples of
confusing programs, such as those in the
<a href="http://www.ioccc.org/">International Obfuscated C Code Contest (IOCCC)</a>.
We agreed on a set of 18 atoms that were necessary to deciphering the three
IOCCC programs we wanted to test with users.

To check out our list of atoms, please click <a href="atoms" title="atoms">here</a>.


In order to validate this initial set of atoms we identified, as well 
as to understand how multiple atoms affect larger bodies of code, we 
designed and conducted two sets of experiments: the 
[atoms existence experiment](2016-snippet-study),
and the [atoms impact experiment](2016-program-study).
We also made our data available for both 
experiments, with personal information anonymized

A copy of our submitted paper can be found <a href="paper.pdf">here</a>.



