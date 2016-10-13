---
layout: page
title: Impact Experiment Errata
---

These are known issues identified in our study after the fact. We report them for full transparency, so that our results may be interpreted more accurately and replication may be performed more easily.

* There was a single [post-increment instruction](/data/#post-increment) left in the post-tranformation question H on [line 45](https://github.com/dgopstein/atoms-of-confusion/blob/master/simplifications/2015-endoh4/nonconfusing.c#L45). We believe that the post-increment is not confusing in this context because the order of incrementation does not affect the result; thus, the results of this question were left in the dataset during analysis. However, if we were to redesign the experiment, this code would be replaced to avoid the use of a post-increment.
