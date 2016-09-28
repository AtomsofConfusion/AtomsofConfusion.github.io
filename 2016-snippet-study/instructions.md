---
layout: page
title: Existence Experiment Methods
---

#### Pre-study

Before doing the experiment, all subjects needed to sign a [consent form](consent.pdf). This form explains the purpose of this experiment, and informs the subject that the participation is voluntary.

#### Instructions

All tests were administered via the web browser and [instructions](instruction-pages) were presented in several pages before the test began.

#### Questions

Participants were asked to report the standard output of 84 tiny (3-22 line) programs chosen in pairs randomly from 126 total [questions](questions.csv).

#### Answers

Full data set (normalized and transcribed) will be available 
soon.

#### Post-study

Subjects completed a [demographic survey](survey.pdf)
after finishing all the questions. 

---

#### Data scrubbing

Data was entered into a web input field, but not validated at all in the instrument. To ensure proper grading of response we conducted a data normalization pass to clean all user responses. A team of two researchers read every answer and made small fixes to typos and unrelated mistakes. Both researchers compared their suggested changes with each other, and only changes agreed upon by both scrubbers were implemented. These are the types of changes that were made:

* Superfluous whitespace: extra spaces, literal `\n`
* Extra characters: `3 5+`, `3, 5` instead of `3 5`
* Letter transpositions: `ture`, `flase`
* Encoded messages: `2butnestedternariesarepainincarnate`
* Wrong type: `1.0` instead of `1`


#### Statistical Analysis

Data was analyzed using R code located [here](https://github.com/dgopstein/atoms-of-confusion/blob/master/snippet_study/results.R).
