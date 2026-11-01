# Algebra course — my solutions

**Sets solved:** `z_04_algt_26Z.pdf` (Zestaw 4 — logic + induction) and `z_05_algt_26Z.pdf` (Zestaw 5 — sets).

**Book of knowledge used:** `lec/w_04_algt.pdf` (Wykład 4 — logic, quantifiers, induction) and `lec/w_05_algt.pdf` (Wykład 5 — set theory).

I am an entry-level student, so I kept the solutions short, simple, and easy to follow.  
Notation: I write `N` for natural numbers, `Z` for integers, `R` for real numbers, `C` for complex numbers.

---

# ZESTAW 4 — LOGIC

## 1. Tautologies?

A **tautology** is a formula that is true for *every* truth assignment of its variables (Wykład 4).  
To show something is NOT a tautology, it is enough to give one counterexample (one assignment making it false).

### (a) `[(p ⇒ q) ∧ (r ⇒ s)] ⇒ [(p ∨ r) ⇒ (q ∨ s)]` — **YES, tautology**

Simple direct proof: assume the left side is true, so `p ⇒ q` and `r ⇒ s` are both true.  
Now prove the right side `(p ∨ r) ⇒ (q ∨ s)`. Assume `p ∨ r` is true.

- If `p` is true, then `p ⇒ q` gives `q`, so `q ∨ s` is true.
- If `r` is true, then `r ⇒ s` gives `s`, so `q ∨ s` is true.

So whenever the left side is true, the right side is true. Hence the whole implication is always true. ✅ Tautology.

### (b) `[(p ∧ q) ⇒ r] ⇒ [(p ⇒ r) ∧ (q ⇒ r)]` — **NOT a tautology**

Counterexample: `p = true`, `q = false`, `r = false`.

- Left side: `(p ∧ q) ⇒ r = (true ∧ false) ⇒ false = false ⇒ false = true`.
- Right side: `(p ⇒ r) ∧ (q ⇒ r) = (true ⇒ false) ∧ (false ⇒ false) = false ∧ true = false`.

Whole formula: `true ⇒ false = false`. ❌ Not a tautology.

### (c) `[p ⇒ (q ⇒ r)] ⇔ [(p ⇒ q) ⇒ r]` — **NOT a tautology**

Counterexample: `p = false`, `q = true`, `r = false`.

- Left side: `p ⇒ (q ⇒ r) = false ⇒ (true ⇒ false) = false ⇒ false = true`.
- Right side: `(p ⇒ q) ⇒ r = (false ⇒ true) ⇒ false = true ⇒ false = false`.

Equivalence `true ⇔ false = false`. ❌ Not a tautology.

---

## 2. The test puzzle

Five yes/no questions. Facts:

1. More answers "tak" (yes) than "nie" (no) → at least 3 "tak".
2. No three consecutive questions have the same answer.
3. Answers to questions 1 and 5 are opposite.
4. The student knows only answer 4, and that determines the **unique** solution.

Let me write `T` = tak, `N` = nie. Denote answers `a₁ a₂ a₃ a₄ a₅`.

Since the student knows `a₄` and gets a unique solution, let's test both possibilities.

### Case A: `a₄ = T`

Because `a₁` and `a₅` are opposite:

- If `a₅ = N`, then `a₁ = T`: sequence `T _ _ T N`. To have ≥ 3 `T`s we need `a₂` or `a₃` equal `T`.
  - `T T T T N` → three consecutive `T` at the start. Forbidden.
  - `T T N T N` → valid (3 `T`s, no three consecutive, `a₁ ≠ a₅`).
  - `T N T T N` → valid.
  - `T N N T N` → only 2 `T`s. Invalid.

- If `a₅ = T`, then `a₁ = N`: sequence `N _ _ T T`. To avoid three consecutive `T`, we need `a₃ = N`. Then `#T` = 3 forces `a₂ = T`: `N T N T T` → valid.

So with `a₄ = T` there are **three** solutions — not unique.

### Case B: `a₄ = N`

- If `a₅ = T`, then `a₁ = N`: `N _ _ N T`. We have only one `T` so far (`a₅`), so we need `a₂ = a₃ = T`: `N T T N T` → check: 3 `T`s ✓, no three consecutive ✓, `a₁ ≠ a₅` ✓. Valid!
- If `a₅ = N`, then `a₁ = T`: `T _ _ N N`. To avoid three consecutive `N`, need `a₃ = T`; then `#T` = 2 only (`a₁`, `a₃`). Invalid.

So with `a₄ = N` there is exactly **one** solution: **`N T T N T`**.

Since the student finds the unique solution knowing answer 4, answer 4 must be `N`, and the solution is:

> **Q1: nie, Q2: tak, Q3: tak, Q4: nie, Q5: tak** → `N T T N T`.

---

## 3. Truth values and negations (without the negation symbol ¬)

Rules from Wykład 4: `¬∀x φ(x) ⇔ ∃x ¬φ(x)`, `¬∃x φ(x) ⇔ ∀x ¬φ(x)`, `¬(A ∧ B) ⇔ ¬A ∨ ¬B`, `¬(A ∨ B) ⇔ ¬A ∧ ¬B`, `¬(A ⇒ B) ⇔ A ∧ ¬B`.  
To avoid `¬` I write inequalities like `≥`, `≤`, `≠` instead.

### (a) `∀n ∈ N ∃m ∈N m < n` — **FALSE**

Take the smallest natural number (0 or 1 depending on convention): there is no natural `m` smaller than it.

Negation: **`∃n ∈ N ∀m ∈ N m ≥ n`** ("there is a natural number that is ≤ every natural number").

### (b) `∀x ∈ R (x < 1 ∨ ∃y ∈ R x = |y|)` — **TRUE**

For any real `x`:
- if `x < 1`, the first part is true;
- if `x ≥ 1`, then `x ≥ 0`, so `x = |x|`, i.e. `∃y x = |y|` (take `y = x`).

So one side is always true. ✅

Negation: **`∃x ∈ R (x ≥ 1 ∧ ∀y ∈ R x ≠ |y|)`**.

### (c) `∃x ∈ R [x < π ⇒ sin x > π]` — **TRUE**

`sin x ≤ 1 < π` for every real `x`, so `sin x > π` is always false.  
Then `x < π ⇒ false` is the same as `x ≥ π`, which holds e.g. for `x = π`. ✅

Negation: **`∀x ∈ R (x < π ∧ sin x ≤ π)`**.

### (d) `(∃x ∈ R sin x > π) ⇒ (∃x ∈ R x < π)` — **TRUE**

`sin x > π` is never true, so the left side (precedent) is false. An implication with a false precedent is always true. ✅

Negation: **`(∃x ∈ R sin x > π) ∧ (∀x ∈ R x ≥ π)`**.

---

## 4. Symbolic notation (no division or "divides" symbols)

### (a) "There exists the smallest natural number."
`∃n ∈ N ∀m ∈ N (n ≤ m)`

### (b) "There exists an integer not divisible by 7."
`∃k ∈ Z ∀l ∈ Z (k ≠ 7·l)`

### (c) "k is a natural number not divisible by seven or divisible by three."
`(k ∈ N ∧ ∀l ∈ Z (k ≠ 7·l)) ∨ (∃l ∈ Z (k = 3·l))`

### (d) "k is a real number which is not a square of an integer."
`k ∈ R ∧ ∀n ∈ Z (k ≠ n²)`

### (e) "Every natural number divisible by six is even."
`∀n ∈ N (∃k ∈ N (n = 6·k) ⇒ ∃l ∈ N (n = 2·l))`

---

## 5. Sets of real numbers satisfying ϕ(x)

### (a) `ϕ(x): x < e ⇒ x > π`
An implication is false only when the left is true and right is false: `x < e` and `x ≤ π`. Since `e ≈ 2.72 < π ≈ 3.14`, every `x < e` satisfies `x ≤ π`. So the implication is false exactly for `x < e`, and true for `x ≥ e`.

**Solution: `[e, ∞)`**

### (b) `ϕ(x): x < e ⇔ x ≤ π`
The equivalence is true when both sides have the same truth value:
- `x < e`: left true, and `x < e < π` so right true → true.
- `e ≤ x ≤ π`: left false, right true → false.
- `x > π`: left false, right false → true.

**Solution: `(-∞, e) ∪ (π, ∞)`**

### (c) `ϕ(x): ∀y ∈ R x < y² + π`
The smallest value of `y² + π` is `π` (at `y = 0`). So we need `x < y² + π` for all `y`, which holds exactly when `x < π` (at `x = π`, taking `y = 0` gives `π < π`, false).

**Solution: `(-∞, π)`**

### (d) `ϕ(x): x > e ⇒ (∀y ∈ R x < y² + π)`
From (c), `∀y x < y² + π` means `x < π`. So this is `x > e ⇒ x < π`, false exactly when `e < x` and `x ≥ π`, i.e. `x ≥ π`.

**Solution: `(-∞, π)`**

---

## 6. Proofs by mathematical induction

Principle (Wykład 4): check the base case, assume the statement for `k`, prove for `k + 1`.

### (a) `1/(1·2) + 1/(2·3) + ... + 1/(n(n+1)) = n/(n+1)` for all `n ∈ N`

**Base n = 1:** left `= 1/2`, right `= 1/2`. ✅

**Step:** assume true for `k`. Add the next term:

`k/(k+1) + 1/((k+1)(k+2)) = (k(k+2) + 1)/((k+1)(k+2)) = (k+1)²/((k+1)(k+2)) = (k+1)/(k+2)`

which is exactly the formula for `n = k + 1`. ✅ Done by induction.

### (b) `1·4 + 2·7 + ... + n(3n+1) = n(n+1)²` for all `n ∈ N`

**Base n = 1:** left `= 1·4 = 4`, right `= 1·2² = 4`. ✅

**Step:** assume true for `k`. Add the next term:

`k(k+1)² + (k+1)(3(k+1)+1) = (k+1)[k(k+1) + (3k+4)] = (k+1)(k² + 4k + 4) = (k+1)(k+2)²`

which is the formula for `n = k + 1`. ✅ Done by induction.

### (c) `3^(4n+2) + 1` is divisible by 10 for every `n ∈ N ∪ {0}`

**Base n = 0:** `3² + 1 = 10`, divisible by 10. ✅

**Step:** assume `3^(4k+2) + 1 = 10m` for some integer `m`, i.e. `3^(4k+2) = 10m − 1`. Then:

`3^(4(k+1)+2) + 1 = 3^(4k+6) + 1 = 81 · 3^(4k+2) + 1 = 81(10m − 1) + 1 = 810m − 80 = 10(81m − 8)`

divisible by 10. ✅ Done by induction.

---

# ZESTAW 5 — SETS

Definitions used: `A ∪ B`, `A ∩ B`, `A \ B`, symmetric difference `A ÷ B = (A \ B) ∪ (B \ A)`, complement `A′`, generalized union `⋃ₜ Aₜ = {x : ∃t x ∈ Aₜ}`, generalized intersection `⋂ₜ Aₜ = {x : ∀t x ∈ Aₜ}` (Wykład 5).

## 1. Complex plane sets

`A = {z ∈ C : |z| < 2}` — open disk centered at 0 with radius 2.  
`B = {z ∈ C : Im z ≤ Re z}` — the half-plane on/below the line `y = x` (writing `z = x + iy`).

Sketches:

- **`A ∪ B`**: the half-plane `Im z ≤ Re z`, plus the part of the disk `|z| < 2` sticking above the line `y = x`.
- **`A ∩ B`**: the part of the disk `|z| < 2` lying below/on the line `y = x`.
- **`A ÷ B`** (symmetric difference): everything in exactly one of A, B — the half-plane plus disk, minus their overlap.
- **`{z : z ∈ A ⇒ z ∈ B}`**: `z ∉ A` or `z ∈ B`, i.e. `A′ ∪ B` — everything outside the disk, together with the half-plane.
- **`{z : z ∈ A ⇔ z ∈ B}`**: points where membership in A and B agrees — `(A ∩ B) ∪ (A′ ∩ B′)`, i.e. (inside disk AND below line) or (outside disk AND above line).

---

## 2. Numbers in {1, ..., 100} not divisible by 2, 3, or 5

Count how many ARE divisible by 2, 3, or 5 using inclusion-exclusion:

- multiples of 2: ⌊100/2⌋ = 50
- multiples of 3: ⌊100/3⌋ = 33
- multiples of 5: ⌊100/5⌋ = 20
- multiples of 6: ⌊100/6⌋ = 16
- multiples of 10: ⌊100/10⌋ = 10
- multiples of 15: ⌊100/15⌋ = 6
- multiples of 30: ⌊100/30⌋ = 3

`|2 ∪ 3 ∪ 5| = 50 + 33 + 20 − 16 − 10 − 6 + 3 = 74`

So numbers divisible by none of them: `100 − 74 = 26`.

**Answer: 26 numbers.**

---

## 3. Generalized union and intersection of families (Aₜ), t ∈ T

### 3.1. `Aₜ = {x ∈ R : x² + 3x − 2tx − 6t = 0}`, T = N

Factor: `x² + 3x − 2tx − 6t = (x + 3)(x − 2t)`. So `Aₜ = {−3, 2t}`.

- **Union:** `⋃ₜ Aₜ = {−3} ∪ {2t : t ∈ N} = {−3, 2, 4, 6, ...}` (if `0 ∈ N`, also `0`).
- **Intersection:** `⋂ₜ Aₜ = {−3}` (only −3 belongs to every set; `2t` changes with t).

### 3.2. `Aₜ = {x ∈ R : 1 + 1/t ≤ x ≤ 3 + 2/t}`, T = N

`A₁ = [2, 5]`, and as t grows the interval shrinks toward `[1, 3]`.

- **Union:** `(1, 5]` — every `x > 1` is in some `Aₜ` (take t large for the left inequality), `x = 1` is in none, `x = 5` is in `A₁`.
- **Intersection:** `[2, 3]` — must satisfy `x ≥ 1 + 1/t` for all t (strongest at t = 1 → `x ≥ 2`) and `x ≤ 3 + 2/t` for all t (→ `x ≤ 3`).

### 3.3. `Aₜ = N \ {2t − 1}`, T = N

`Aₜ` removes the odd number `2t − 1` (1, 3, 5, ...).

- **Union:** `N` — every natural number survives in some `Aₜ` (remove a *different* odd number).
- **Intersection:** even natural numbers `{2, 4, 6, ...}` (all odd numbers are removed for some t; evens are never removed).

### 3.4. `Aₜ = {x ∈ R : 3 + (−1)ᵗ − (−1)ᵗ·t < x < 7 + (−1)ᵗ − (−1)ᵗ·t}`, T = N

An open interval of length 4, shifted by `cₜ = (−1)ᵗ(1 − t)`.  
Examples: `A₁ = (3, 7)`, `A₂ = (2, 6)`, `A₃ = (5, 9)`, `A₄ = (0, 4)`, `A₅ = (7, 11)`, ...

- **Union:** `R` — intervals stretch to both `−∞` and `+∞` and overlap.
- **Intersection:** `∅` — e.g. `A₁ = (3, 7)` and `A₅ = (7, 11)` are already disjoint.

---

## 4. Sketching sets in the plane

### 4.1. `Aₜ = {(x, y) : x² + (y + t)² > t²}`, t ∈ N₀

Outside the circle centered `(0, −t)` with radius `t` (each circle passes through the origin).

- **`A₁, A₂, (A₃)′`**: individual exteriors; `(A₃)′` is the *inside* (including boundary) of the circle centered `(0, −3)` radius 3.
- **`⋂ₜ Aₜ`**: upper half-plane `y > 0`, plus the x-axis except the origin `(x, 0)` with `x ≠ 0`.
- **`⋃ₜ Aₜ`**: the whole plane except the origin `R² \ {(0, 0)}` (since `A₀ = {x² + y² > 0}`).
- **`⋃ₜ (Aₜ)′`**: lower half-plane `y < 0`, plus the origin `(0, 0)`.

### 4.2. `Aₜ = {(x, y) : y < t|x| + 1}`, t ∈ R⁺

Region below the V-shaped line `y = t|x| + 1`.

- **`A₁`**: below `y = |x| + 1`. **`A₃`**: below `y = 3|x| + 1` (steeper V).
- **`⋂ₜ Aₜ`**: `y ≤ 1`, except the point `(0, 1)` — since at `x = 0` we need `y < 1`, but for `x ≠ 0`, `y = 1` still satisfies `1 < t|x| + 1` for every `t > 0`.
- **`⋃ₜ Aₜ`**: everything except the vertical ray `{(0, y) : y ≥ 1}` — at `x = 0` we need `y < 1`, but for any `x ≠ 0`, taking `t` large covers any `y`.

### 4.3. `Aₜ = {(x, y) : y ≤ t·x(x − 2)}`, t ∈ N₀

Region below the parabola `y = t·x(x − 2)` (for `t = 0`: the x-axis `y ≤ 0`).

- **`A₀`**: `y ≤ 0`. **`A₁`**: below `y = x(x − 2)`. **`A₂`**: below `y = 2x(x − 2)`.
- **`⋂ₜ Aₜ`**: `y ≤ 0` with `x ≤ 0` or `x ≥ 2` — the strip `0 < x < 2` disappears completely (there `x(x−2) < 0`, so no `y` works for all large `t`).
- **`⋃ₜ Aₜ`**: the whole plane except the open rectangle `(0, 2) × (0, ∞)` — for `x < 0` or `x > 2`, large `t` covers every `y`; inside `0 < x < 2` only `y ≤ 0` survives.

### 4.4. `Aₜ = {z ∈ C : |z| ≤ 2 − sin t}`, t ∈ R

Closed disk centered at 0 with radius `2 − sin t ∈ [1, 3]`.

- **`⋂ₜ Aₜ`**: closed disk of radius `1` (must fit in all, smallest radius is `2 − 1 = 1`).
- **`⋃ₜ Aₜ`**: closed disk of radius `3` (largest radius `2 − (−1) = 3` is achieved).

---

**Sources used:** lecture notes `lec/w_04_algt.pdf` (truth tables, implication/equivalence, quantifier laws, induction principle) and `lec/w_05_algt.pdf` (set operations, complement, generalized union/intersection, De Morgan's laws).
