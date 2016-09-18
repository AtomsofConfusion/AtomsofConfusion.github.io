---
layout: page
title: Existence Experiment
link: Existence
permalink: /2016-snippet-study/
tags: snippet
---

We designed a test to validate an initial set of atom candidates (see [data](data) for a list). Programmers were shown a series of code snippets and asked to hand evaluate each piece of code and submit the standard output. Questions were formulated in pairs, each structurally similar, but one containing an atom of confusion, and the other transformed to remove the atom. Each snippet was designed to be “minimal,” the smallest possible piece of code to exhibit the effect of the atom. Only one atom was tested per snippet, which contained an average of 6 lines of code (excluding main function signature and print statements). We created three pairs of atom candidate/transformed questions per atom. Questions were designed specifically to elicit confusion due to the presence of an atom, and not from any external source. All variables were named using V1, V2, etc., and every macro was listed as M1, M2, etc., and no complicated math was required.

We recruited and tested 73 subjects. Each subject was required to have at least 3 months experience with the C or C++ programming languages. Our subjects were predominantly students at large North American universities. The questions were presented via a web interface, and are partitioned into control and treatment groups. Source was displayed with no syntax highlighting, since the selection of any particular highlighting scheme would bias our results. Eight of the participants were directly supervised as they took the test, while the remaining subjects completed the exercise online.

With the data from this experiment we will explore the following questions:

- Which atom candidates can we accept as atoms?
- Is there a natural grouping of users based on their
answers?
- Did subjects err in the same way?

For the details of our methods please consult our [replication packet](instructions)
