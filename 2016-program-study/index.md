---
layout: page
title: Impact Experiment
link: Impact
permalink: /2016-program-study/
tags: program
---

<div class="toc">
  <h4 class="toc-title">Materials</h4>
  <ul>
    <li><a href="consent.pdf">Consent Form</a></li>
    <li><a href="in-person">In-person Instructions</a></li>
    <li><a href="remote">Remote Instructions</a></li>
    <li><a href="questions">Questions</a></li>
    <li><a href="survey.pdf">Demographic Survey</a></li>
    <li><a href="sample">Sample Response</a></li>
    <li><a href="https://github.com/dgopstein/atoms-of-confusion/tree/master/program_study">Grading Instrument</a></li>
    <li><a href="https://github.com/dgopstein/atoms-of-confusion/blob/master/program_study/grader/results.R">Analysis Script</a></li>
    <li><a href="results_raw.csv">Raw Results</a></li>
    <li><a href="results_normalized.csv">Normalized Results</a></li>
  </ul>
</div>

Testing atoms isolated in minimal examples, like in the atoms 
[existence experiment](/2016-snippet-study/), is crucial for gaining a rigorous understanding 
of the relative confusion and removability of an individual atom. To 
broaden our understanding of how multiple atoms affect larger bodies 
of code, we tested their impact on a broader sample from the source of 
the code snippets. The experiment used winning programs from the IOCCC 
to test subjects' ability to hand evaluate each full program. For each 
code sample, half of our subjects performed the hand evaluation task 
on code in its near-original form, and the other half evaluated the same 
code after all of its known atoms were removed. Our hypothesis was that 
programmers would make fewer evaluation errors on code which had its 
atoms of confusion removed.

With the data from this experiment we will explore the following 
questions:

* Are clarified programs evaluated more accurately than obfuscated programs?	
* What other ways can we measure subject performance?	
* Which code was still confusing in clarified questions?	

We recruited 43 programmers with at least 6 months experience with C or 
C++. We presented them (1) small programs (between 14-84 lines) containing 
several atoms of confusion, and (2) a version of the same programs 
transformed to remove the atoms of confusion. The subjects were asked to 
hand evaluate the output of both versions of the programs. We would like 
to verify that _multiple atoms of confusion cause more errors than other 
code in hand-evaluated outputs_.


### Pre-study
Before doing the experiment, all subjects needed to sign a 
[consent form](consent.pdf). This form explains the purpose
of this experiment, and informs the subject that the participation is
voluntary.

---

### Core materials

#### Instructions

We designed instructions for [in-person](in-person)
study, and [remote](remote) study, as some of our
subjects were remote. 

#### Questions and sample answers

In total, we designed four programs, each with its confusing (with 
atoms) and non-confusing version (with atoms removed). The full list
of programs can be found [here](questions). They are 
named as question A/B/C/D/E/F/G/H, respectively. For example, question 
A and B are the confusing and non-confusing version of the same program.
For each subject, we chose a random subset of four out of the eight questions, 
and made sure that they do not see both the confusing and non-confusing
version of the same program.

After each experiment with a subject, we scanned the hand written 
results, normalized and transcribed the results. Here is a 
[sample answer](sample) from a subject after we obtained 
consent. The answer includes both the hand written and the transcribed 
versions.

We transcibed each result, available [here](results_raw.csv).
Note: a fully coded and normalized version is available below.


---

### Post-study

Subjects completed a [demographic survey](survey.pdf)
after finishing all the questions. 

---

#### Data normalization

All user responses were hand-written and had to be manually transcribed. The format of the subject responses occassionally varied and necessitated a data normalization pass. Two researchers went over every response and corrected typos and small errors where possible and coded common patterns. Both researchers compared their suggested changes with each other, and only changes agreed upon by both coders were implemented. These are the types of changes that were made:

* If the subject added superfluous commas, quotes, control characters, etc we removed them.
* If the subject wrote a parenthetical comment we removed the comment.
* If the subject left out a value, or wrote "value in memory", "random address", etc we replaced it with `?`.
* If the subject wrote "error"/"segfault"/"infinite loop" we replaced it with `X`.
* If the subject wrote "I gave up" we replaced it with `!`.

The normalized data set is available [here](results_normalized.csv).
Note: a raw, uncoded/unnormalized version is available above.

#### Grading

Transcribed results were graded, aggregated, and formatted with programs described in this [README](https://github.com/dgopstein/atoms-of-confusion/tree/master/program_study).

#### Statistical analysis

Data was analyzed using R code located [here](https://github.com/dgopstein/atoms-of-confusion/blob/master/program_study/grader/results.R).

#### Errata

Any known issues with the study discovered after the administration and collection of data are described in detail [here](errata)
