---
layout: page
title: Existence Study Errata
---

These are known issues identified in our study after the fact. We report them for full transparency, so that our results may be interpreted more accurately and replication may be performed more easily.

* The source code of **Question 39** (Macro Operator Precedence, Obfuscated) had an unintentional semantic error that made the code unable to be compiled. In our instructions we listed that all code would compile without error. As a result we chose to discard all responses from this question from our data. This choice was made before any analysis of our results had begun.

* All code snippets included in this study were designed to be minimal, so as not to add external sources of confusion into our results. **Questions 51/52** (Conditional Operator) contained two, nested, instances of the conditional operator instead of just 1. The results of this question were left in the dataset during analysis, however if we were to re-design this experiment, the question would be simplified to only have one occurence of the atom. While this design flaw may have artificially inflated the effect size we report, we do not believe that removing the redundancy would cause the *Conditional Operator* atom not to reject the null hypothesis.

* To remove the bias introduced by code formatting, we chose not to study the effect of whitespace in this study. That decision was made before running the atom existence study, however we chose to include 2 question sets with whitespace related questions just in case. We have not yet analyzed these results or used them for anything, though we have released the data so that other researchers may analyze them. The IDs associated with these questions are 31-36 and 121-126.

* We intended to keep integer literals small, to minimize the difficulty of arithmetic computation. The following questions had larger than desirable constants:
  * Question &nbsp;&nbsp;37: &nbsp;&nbsp;`64 - 1 * 2`
  * Question &nbsp;&nbsp;38: &nbsp;&nbsp;`128 - 1 * 2`
  * Question 107: &nbsp;&nbsp;`208 & 13`
  * Question 119: &nbsp;&nbsp;`char V2 = 261`
  * Question 120: &nbsp;&nbsp;`char V2 = 288 % 256`


