---
layout: page
title: Questions
---

<style>
  h3 {
    font-size: 18pt;
  }

  h4 {
    font-size: 14pt;
  }

  code {
    font-size: 12pt;
  }
</style>


The following is the full set of questions used in the atom impact study.
Raw source code is available
[here](https://github.com/dgopstein/atoms-of-confusion/tree/master/program_study/).

---

### Question 1

#### Obfuscated (program A, filename a.c): ####

```
#include <stdio.h>
void F1(int V1, char *V2, int V3) {
  printf("a: %d %s %d\n", V1, V2, V3);
  int V4 = V1 / V3 + V3;
  char *V5 = V2-- - V1;
  int V6 = (int)V2 / (int)V2;
  printf("b: %d %s %d\n", V4, V5, V6);
}
int V7;
int main() {
  for (; V7["ab"]; F1('a' - 'a', V7++ + "zy", 'z' / 'z'))
    ;
  printf("c\n");
}
```


#### Transformed (program B, filename b.c):

```
#include <stdio.h>

void F1(int V1, char *V2, int V3) {
  printf("a: %d %s %d\n", V1, V2, V3);
  int V4 = (V1 / V3) + V3;
  char *V5 = V2 - V1;
  V2 = V2 - 1;
  int V6 = (int)V2 / (int)V2;
  printf("b: %d %s %d\n", V4, V5, V6);
}
int V7;
int main() {
  for (; "ab"[V7] != 0;) {
    F1(97 - 97, V7 + "zy", 122 / 122);
    V7 = V7 + 1;
  }
  printf("c\n");
}
```


---

### Question 2

#### Obfuscated (program C, filename c.c):

```
#include <stdio.h>

void F1(int V1, int V2, int V3, int V4) {
  while ((V2 = ++V1) < 4)
    for (V3 = 0; printf("a: %d %d %d %d\n", V1, V2, V3, V4),
        V3 < V2 ? V3 = V3 * 8 + V2 % 8, V2 /= 8, V4 = V3 == V2 | V3 / 8 == V2,
        1 : (V1 - ++V4 || (printf("b: %d\n", V1), 2)) && V1 % V4;)
      ;
}

int main() {
  F1(1, 0, 0, 0);
  printf("c\n");
}
```


#### Transformed (program D, filename d.c):

```
#include <stdio.h>

void F1(int V1, int V2, int V3, int V4) {
  V1 = V1 + 1;
  V2 = V1;
  while (V2 < 4) {
    V3 = 0;

    printf("a: %d %d %d %d\n", V1, V2, V3, V4);
    int V9;
    if (V3 < V2) {
      V3 = (V3 * 8) + (V2 % 8);
      V2 /= 8;
      V4 = (V3 == V2) | ((V3 / 8) == V2);
      V9 = 1;
    } else {
      V4 = V4 + 1;
      if ((V1 - V4) != 0) {
        V9 = V1 % V4;
      } else {
        printf("b: %d\n", V1);
        V9 = 2 && (V1 % V4);
      }
    }

    for (; V9;) {
      printf("c: %d %d %d %d\n", V1, V2, V3, V4);
      if (V3 < V2) {
        V3 = (V3 * 8) + (V2 % 8);
        V2 /= 8;
        V4 = (V3 == V2) | ((V3 / 8) == V2);
        V9 = 1;
      } else {
        V4 = V4 + 1;
        if ((V1 - V4) != 0) {
          V9 = V1 % V4;
        } else {
          printf("d: %d\n", V1);
          V9 = 2 && (V1 % V4);
        }
      }
    }

    V1 = V1 + 1;
    V2 = V1;
  }
}

int main() {
  F1(1, 0, 0, 0);
  printf("e\n");
}

```


---

### Question 3

#### Obfuscated (program E, filename e.c):

```
#include <stdio.h>

double V4;
int V5;

int F1(int V1, int V2, int V3) {
  printf("a: %d %d %d %f\n", V1, V2, V3, V4);
  return printf(
      "b: %c\n",
      (V1-- + 1 && V1 + 4 && F1(V1, -1, V1), V1 && V2)
          ? (F1(-1, ++V2, V3),
             ((V5 = (int)(V4 = (int)(V2 + 1) /
                               (1 - (int)V3 * 2 - (int)V3 * (int)V3),
                          V4 * V4 >= 1 && ((2 % 3) / 4 - 2 + (V4 / 2)) < 1),
               printf("c: %d %d %d %f %d\n", V1, V2, V3, V4, V5), V5)["ab"]))
          : 'c');
}

int main() {
  F1(-1, -2, 0);
  printf("d\n");
}
```

#### Transformed (program F, filename f.c):

```
#include <math.h>
#include <stdio.h>
double V4;

int F1(int V1, int V2, int V3) {
  int V5 = V1;
  char V6;

  printf("a: %d %d %d %f\n", V1, V2, V3, V4);

  V1 = V1 - 1;
  if (V5 + 1 != 0 && V5 + 4 != 0) {
    F1(V1, -1, V1);
  }

  if (V1 && V2) {
    V2 = V2 + 1;
    F1(-1, V2, V3);
    V4 = trunc((int)(V2 + 1) / (1 - ((int)V3 * 2) - ((int)V3 * (int)V3)));
    int V7 =
        ((V4 * V4) >= 1) && ((((int)trunc((2 % 3) / 4) - 2) + (V4 / 2)) < 1);
    printf("c: %d %d %d %f %d\n", V1, V2, V3, V4, V7);
    V6 = "ab"[V7];
  } else {
    V6 = 'c';
  }

  return printf("b: %c\n", V6);
}

int main() {
  F1(-1, -2, 0);
  printf("d\n");
}
```

---

### Question 4

#### Obfuscated (program G, filename g.c):

```
#include <stdio.h>

int F1(int V1, int V2) {
  int V3, V4;

  printf("a: %d %d\n", V1, V2);

  for (V3 = V4 = 1; V3* V3 <= V1 ? V4 = V1 % V3 ? V4 : V3 : V2 + 1
                    ? V4 < 2 ? V1 && F1(V2, 0) : F1(V4, V2),
      printf("b: %d\n", V2 ? 10 : 32 << !V1),
      V1 -= V4 * !!V1 : (F1(V4, V1 / V4), 0);) {
    printf("c: %d %d\n", V1, V4);
    V3++;
  }

  return 0;
}

int main() {
  F1(1, 0);
  printf("d\n");
}
```

#### Transformed (program H, filename h.c):

```
include <stdio.h>

int F1(int V1, int V2) {
  int V3, V4;

  printf("a: %d %d\n", V1, V2);

  V4 = 1;
  V3 = V4;

  int V5;

  if (V3 * V3 <= V1) {
    if (V1 % V3 != 0) {
      V4 = V4;
      V5 = V4;
    } else {
      V4 = V3;
      V5 = V4;
    }
  } else {
    if (V2 + 1 != 0) {
      if (V4 < 2) {
        if (V1 != 0) {
          F1(V2, 0);
        }
      } else {
        F1(V4, V2);
      }
      if (V2 != 0) {
        printf("1: %d\n", 10);
      } else {
        printf("2: %d\n", 32 << !V1);
      }
      V1 -= V4 * !!V1;
      V5 = V1;
    } else {
      F1(V4, V1 / V4);
      V5 = 0;
    }
  }

  for (; V5 != 0;) {
    printf("b: %d %d\n", V1, V4);
    V3++;

    if (V3 * V3 <= V1) {
      if (V1 % V3 != 0) {
        V4 = V4;
        V5 = V4;
      } else {
        V4 = V3;
        V5 = V4;
      }
    } else {
      if (V2 + 1 != 0) {
        if (V4 < 2) {
          if (V1 != 0) {
            F1(V2, 0);
          }
        } else {
          F1(V4, V2);
        }
        if (V2 != 0) {
          printf("3: %d\n", 10);
        } else {
          printf("4: %d\n", 32 << !V1);
        }
        V1 -= V4 * !!V1;
        V5 = V1;
      } else {
        F1(V4, V1 / V4);
        V5 = 0;
      }
    }
  }

  return 0;
}

int main() {
  F1(1, 0);
  printf("d\n");
}
```
