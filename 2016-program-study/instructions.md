---
layout: page
title: Impact Experiment Methods
---

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

Full data set (normalized and transcribed) will be available 
soon.

---

### Post-study

Subjects completed a [demographic survey](survey.pdf)
after finishing all the questions. 

---

#### Data scrubbing

All user responses were hand-written and had to be manually transcribed. The format of the subject responses occassionally varied and necessitated a data normalization pass. Two researchers went over every response and corrected typos and small errors where possible and coded common patterns. Both researchers compared their suggested changes with each other, and only changes agreed upon by both scrubbers were implemented. These are the types of changes that were made:

* If the subject added superfluous commas, quotes, control characters, etc we removed them.
* If the subject wrote a parenthetical comment we removed the comment.
* If the subject left out a value, or wrote "value in memory", "random address", etc we replaced it with `?`.
* If the subject wrote "error"/"segfault"/"infinite loop" we replaced it with `X`.
* If the subject wrote "I gave up" we replaced it with `!`.


#### Grading

Transcribed results were graded, aggregated, and formatted with programs described in this [README](https://github.com/dgopstein/atoms-of-confusion/tree/master/program_study).

#### Statistical analysis

Data was analyzed using R code located [here](https://github.com/dgopstein/atoms-of-confusion/blob/master/program_study/grader/results.R).
