---
layout: page
title: Theory
---

We study situations where a programmer misunderstands the behavior of a piece of code.
For example, we found that a significant number of programmers misinterpret
<code class='code'>a = b++</code>
as though the increment of <code class='code'>b</code> happens before the assignment to <code class='code'>a</code>.
We want to identify such patterns of code that cause confusion for programmers.

We design our work to find code that is objectively confusing, minimal and as precise as possible, and targeted to exclude confounding effects.

### Confusion

The objective concept we call *confusion* occurs during manual evaluation of source code.
Confusion is observed when a programmer evaluates a piece of code differently than the language specification dictates.

### Atom

We propose that the smallest unit of code that can cause confusion can be isolated. This piece of code is confusing in its original form, and cannot be made any smaller without losing its ability to confuse readers. We call this smallest piece of confusing code an *atom*.

### Exclusion

We exclude from our investigation types of confusion based on cognitive inability or lack of information.
Specifically, we discount any confusion caused by code that is non-deterministic, undefined/non-portable, computationally-intensive, or API related.
