---
layout: page
title: Existence Experiment
link: Existence
permalink: /2016-snippet-study/
tags: snippet
---

<div class="toc">
  <h4 style="margin: 0px 0px 15px 0px; text-align: center;">Materials</h4>
  <ul>
    <li><a href="consent.pdf">Consent Form</a></li>
    <li><a href="instruction-pages">Instructions</a></li>
    <li><a href="questions.csv">Questions</a></li>
    <li><a href="survey.pdf">Demographic Survey</a></li>
    <li><a href="results_raw.csv">Raw Results</a></li>
    <li><a href="results_normalized.csv">Normalized Results</a></li>
    <li><a href="https://github.com/dgopstein/atoms-of-confusion/blob/master/snippet_study/results.R">Analysis Script</a></li>
  </ul>
</div>

We designed a test to validate an initial set of atom candidates (see [data](data) for a list). Programmers were shown a series of code snippets and asked to hand evaluate each piece of code and submit the standard output. Questions were formulated in pairs, each structurally similar, but one containing an atom of confusion, and the other transformed to remove the atom. Each snippet was designed to be “minimal,” the smallest possible piece of code to exhibit the effect of the atom. Only one atom was tested per snippet, which contained an average of 6 lines of code (excluding main function signature and print statements). We created three pairs of atom candidate/transformed questions per atom. Questions were designed specifically to elicit confusion due to the presence of an atom, and not from any external source. All variables were named using V1, V2, etc., and every macro was listed as M1, M2, etc., and no complicated math was required.

We recruited and tested 73 subjects. Each subject was required to have at least 3 months experience with the C or C++ programming languages. Our subjects were predominantly students at large North American universities. The questions were presented via a web interface, and are partitioned into control and treatment groups. Source was displayed with no syntax highlighting, since the selection of any particular highlighting scheme would bias our results. Eight of the participants were directly supervised as they took the test, while the remaining subjects completed the exercise online.

With the data from this experiment we will explore the following questions:

- Which atom candidates can we accept as atoms?
- Is there a natural grouping of users based on their
answers?
- Did subjects err in the same way?

#### Pre-study

Before doing the experiment, all subjects needed to sign a [consent form](consent.pdf). This form explains the purpose of this experiment, and informs the subject that the participation is voluntary.

#### Instructions

All tests were administered via the web browser and [instructions](instruction-pages) were presented in several pages before the test began.

#### Questions

Participants were asked to report the standard output of 84 tiny (3-22 line) programs chosen in pairs randomly from 126 total [questions](questions.csv).

#### Answers

We transcibed each result, available [here](results_raw.csv).
Note: a fully coded and normalized version is available below.

#### Post-study

Subjects completed a [demographic survey](survey.pdf)
after finishing all the questions. 

---

#### Data normalization

Data was entered into a web input field, but not validated at all in the instrument. To ensure proper grading of response we conducted a data normalization pass to clean all user responses. A team of two researchers read every answer and made small fixes to typos and unrelated mistakes. Both researchers compared their suggested changes with each other, and only changes agreed upon by both coders were implemented. These are the types of changes that were made:

* Superfluous whitespace: extra spaces, literal `\n`
* Extra characters: `3 5+`, `3, 5` instead of `3 5`
* Letter transpositions: `ture`, `flase`
* Encoded messages: `2butnestedternariesarepainincarnate`
* Wrong type: `1.0` instead of `1`

The normalized data set is available [here](results_normalized.csv).
Note: a raw, uncoded/unnormalized version is available above.

#### Statistical Analysis

Data was analyzed using R code located [here](https://github.com/dgopstein/atoms-of-confusion/blob/master/snippet_study/results.R).
