---
layout: page
title: Theory
---

We study situations where a programmer misunderstands the behavior of a piece of code.
For example, we found that a significant number of programmers misinterpret
<code class='code'>a = b++</code>
as though the increment of <code class='code'>b</code> happens before the assignment to <code class='code'>a</code>.
We want to identify such patterns of code that cause confusion in programmers.

We design our work to find code that is objectively confusing, minimal and precise as possible, and targeted to exclude confounding effects.

### Confusion

There is an objective concept we call *confusion* that occurs during manual evaluation of source code.
Confusion is observed when a programmer evaluates a piece of code differently than the language specification dictates.

### Atom

We propose there is a smallest unit of code that causes confusion. A piece of code that while confusing in its original form, cannot be shrunk without losing its ability to confuse readers. We call this smallest piece of confusing code an *atom*.

### Exclusion

We limit our investigation from types of confusion based on cognitive inability or lack of information.
Specifically we discount any confusion caused by code that is non-deterministic, undefined/non-portable, computationally intenisive, or API related.

