---
layout: page
title: Atoms
permalink: /atoms/
tags: atoms
---

          
<h2>Binary Operator Precedence</h2>

<p>There are 32 binary operators (operators which accept one operand
before and one operand after) in C. Each of these operators falls into
one of 15 precedence classes and has either right-to-left or left-to-right
associativity. Needless to say, the average programmer knows only a
functional subset of the information needed to correctly parse complicated
expressions of binary operations. </p>

<p>Our preferred method for removing precedence confusion is with
parenthesis. Other removal transformations are possible, such as
introducing intermediate identifiers. These other strategies can have
larger impacts on the structure of the code and so were avoided when
possible.</p>

<p><b>Confusing:</b> 0 && 1 || 2</p>

<p><b>Non-confusing:</b> (0 && 1) || 2</p>

<h2>Implicit Predicate</h2>

<p>In C there is no syntactic difference between an numerical values
and predicates. Instead, the semantics change based on context. In the
rvalue of a char assignment, i.e., char c = expr the expression
(assuming it itself makes no variable assignments or updates) can
result in up to 256 different states of the of the program. By contrast,
the same expression in the context of a predicate, i.e., if (expr)
can only result in a maximum of two different program states. Often in
the context of a condition, the reader can become confused as to effect
of a certain predicate value. We clarified these by explicitly adding
logical operators to the predicates.</p>

<p><b>Confusing:</b> if (4 % 2)</p>

<p><b>Non-confusing:</b> if (4 % 2 != 0) </p>


<h2>Post-increment/decrement</h2>

<p>The post-increment (and decrement) operator increases the value of
its operand variable by 1, while returning the original value of the
variable. Confusion here arises because the value of the expression is
different from the resultant value of the variable.</p>

<p><b>Confusing:</b> V1 = V2++; </p>

<p><b>Non-confusing:</b> V1 = V2; V2 += 1; </p>



<h2>Pre-increment/decrement</h2>

<p>Similar to post-increment and post-decrement, the pre-increment
and pre-decrement operators change a variables value by one. In
contrast to the other operators, pre-increment and pre-decrement
first update the variable then return the new value, instead of the old.</p>

<p><b>Confusing:</b> V1 = ++V; </p>

<p><b>Non-confusing:</b> V2 += 1; V1 = V2; </p>


<h2>Constant Variables</h2>

<p>Constant variables are a layer of abstraction that, in the
context of a complex system, let us focus on the concept a value
represents rather than the value itself. When simply trying to
determine the output of a piece of code, having a layer of indirection
that hides the value of your data can cause difficulty.</p>

<p><b>Confusing:</b> V1 = V2; </p>

<p><b>Non-confusing:</b> V1 = 5; </p>


<h2>Macro</h2>

<p>Macros can be used to add many features to C, including guaranteed
inlining, duck-typing, and adding metadata like line number and file
name to program output. Unfortunately, macro references are impossible
to distinguish from other identifiers and can often act in ways that
variables and functions can not.  This can cause readers to be misled.</p>

<p><b>Confusing:</b> #define M1 64 - 1 </p>
<p>                  2 * M1</p>

<p><b>Non-confusing:</b> 2 * 64 - 1 </p>


<h2>Pointer Arithmetic</h2>

<p>Pointers admit several operations like integer addition/subtraction,
but, in many cases, these operations are interpreted by the reader to
update the target data instead of the pointer data.</p>

<p><b>Confusing:</b> "abcdef"+3</p>

<p><b>Non-confusing:</b> "abcdef"[3]</p>


<h2>Conditional Operator</h2>

<p>The conditional operator is the only ternary operator in C, and functions
similarly to an if/else block. However, the conditional operator is an
expression for which the value is that of the executed branch.</p>

<p><b>Confusing:</b> V2 = V1 == 3 ? 2 : 1;</p>

<p><b>Non-confusing:</b> if (V1 == 3)
   V2 = 2;
 else
   V2 = 1;
</p>


<h2>Arithmetic as Logic</h2>

<p>Arithmetic operators are capable of mimicking any predicate formulated
with logical operators. Arithmetic, however, implies a non-Boolean range,
which may be confusing to a reader.</p>

<p><b>Confusing:</b> (V1 - 3) * (V2 - 4)</p>

<p><b>Non-confusing:</b> V1 != 3 && V2 != 4</p>


<h2>Comma Operator</h2>

<p>The comma operator is used to sequence an otherwise ambiguous series
of computations. Whether due to its eccentricity, or its odd precedence,
the comma operator is commonly misinterpreted.</p>

<p><b>Confusing:</b> V3 = (V1++, V1);</p>

<p><b>Non-confusing:</b> V1++;
  V3 = V1;
</p>


<h2>Preprocessor directive in expression</h2>

<p>Preprocessor directives must stand alone on their own line. After
the preprocessor runs, however, that line is treated as whitespace. As
a result, preprocessor directives may be present in the middle of an
expression as long as they are on their own lines. Since the preprocessor
directive and the source code are processed in different compiler phases,
they are processed independently. Yet, to the casual reader, they appear
to interact with each other.</p>

<p><b>Confusing:</b> int V1 = 1
  #define M1 1
  +1;
</p>

<p><b>Non-confusing:</b> #define M1 1
  int V1 = 1 + 1;
</p>


<h2>Assignment used as value</h2>

<p>The assignment expression changes the underlying state of the machine
when it executes. However, it also returns a value. Often when reading an
assignment expression people will forget one of the two effects of the
expression.</p>

<p><b>Confusing:</b> V1 = V2 = 3;</p>

<p><b>Non-confusing:</b> V2 = 3; V1 = V2;</p>


<h2>Logic as Control Flow</h2>

<p>Traditionally, the && and || operators are used for logical conjunction
and disjunction, respectively, in predicates. Due to short-circuiting,
they can also be used for conditional execution.</p>

<p><b>Confusing:</b> V1 && F2();</p>

<p><b>Non-confusing:</b> if (V1) F2();</p>


<h2>Re-purposed Variables</h2>

<p>By convention, variables tend to have a single conceptual identify and
represent one idea. When a variable is used in different roles across the
lifetime of the program, its current purpose can be difficult to follow.</p>

<p><b>Confusing:</b> int main(int argc, char **argv) {
    argc = 7;
    ...
</p>

<p><b>Non-confusing:</b> int main(int argc, char **argv) {
    int V1 = 7;
    ...
</p>


<h2>Reversed subscript operands</h2>

<p>Arrays can be indexed using the subscript operator, but underneath ``E1[E2]
is identical to (*((E1)+(E2)))''. Since addition is commutative, so too is the
subscript operator.</p>

<p><b>Confusing:</b> [1]"abc"; </p>

<p><b>Non-confusing:</b> "abc"[1] </p>


<h2>Change of Literal Encoding</h2>

<p>All numbers are stored in binary inside of a computer, but for human
convenience we tend to represent numbers in decimal, and occasionally
hexadecimal or octal for certain uses. Even though different representations
can hold the same number, their accessibility to humans for different
computations can be very different.</p>

<p><b>Confusing:</b> 208 & 13</p>

<p><b>Non-confusing:</b> 0xD0 & 0x0D</p>


<h2>Omitted Curly Braces</h2>

<p>C looping and selection exhibit dynamic behavior over a trailing
statement. The trailing statement, optionally, can be enclosed in
braces for clarity, or to extend the number of sub-statements modified
by the loop or conditional. Confusion may arise when the braces are
omitted for brevity.</p>

<p><b>Confusing:</b> if (V1) F1(); F2();</p>

<p><b>Non-confusing:</b> if (V1) { F1(); } F2(); </p>


<h2>Type Conversion</h2>
<p>The C compiler will implicitly convert types in various situations
when there is a mismatch, but sometimes this conversion also results in
an implicit change of outcome from what the author may have intended.</p>

<p><b>Confusing:</b> 3/2; </p>

<p><b>Non-confusing:</b> trunc(3.0/2.0); </p>

