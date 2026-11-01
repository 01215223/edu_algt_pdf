# Lab_0 (20–22 X) — rozwiązania krok po kroku

Kod do wklejenia: **`rozwiazania_lab_0.m`** (sekcje `%% Z1` … `%% Z5` odpowiadają zadaniom).
W MATLAB-ie: otwórz plik → `Run`, albo ustaw kursor w sekcji i `Ctrl+Enter`.

Ogólna zasada: **numerycznie** = zwykła liczba (`double`, wynik przybliżony),
**symbolicznie** = `sym(...)`, wynik dokładny (ułamki, pierwiastki, π).

---

## Z1. Liczby rzeczywiste — numerycznie i symbolicznie

**Kod (2 linie):**

```matlab
sqrt(52), nthroot(pi,4), log(3/4), exp(-4), sin(7*pi/4)                       % numerycznie
sqrt(sym(52)), sym(pi)^(1/4), log(sym(3)/4), exp(sym(-4)), sin(7*sym(pi)/4)   % symbolicznie
```

**Wyniki:**

| wyrażenie | numerycznie | symbolicznie |
|---|---|---|
| √52 | `7.2111` | `2*13^(1/2)` |
| ⁴√π | `1.3313` | `pi^(1/4)` |
| ln(3/4) | `-0.2877` | `log(3/4)` |
| e⁻⁴ | `0.018316` | `exp(-4)` |
| sin(7π/4) | `-0.7071` | `-2^(1/2)/2` |

**Uwaga:** kolejność ma znaczenie. `sqrt(sym(52))` daje dokładne `2√13`, ale `sym(sqrt(52))`
da brzydki ułamek, bo najpierw policzy się przybliżenie. Dlatego `sym(pi)`, a nie `sym` z gotowej liczby.
`vpa(wyrażenie, 10)` zamienia wynik dokładny na dziesiętny.

---

## Z2. Liczby zespolone — postać symboliczna

**Kod:**

```matlab
u  = sym(1i);                        % symboliczna jednostka urojona
z1 = simplify((5-7*u)/(3-u))         % 11/5 - 8j/5
z2 = expand((-1+u*sqrt(sym(3)))^4)   % -8 + 8*sqrt(3)j
conj(z1)                             % 11/5 + 8j/5
real(z1)                             % 11/5
imag(z2)                             % 8*sqrt(3)
abs(4*sqrt(sym(3))-8*u)              % 4*sqrt(7)
angle(6*u-6)                         % 3*pi/4
```

**Wyniki:**

| co | wynik dokładny | przybliżenie |
|---|---|---|
| z₁ = (5−7j)/(3−j) | 11/5 − 8/5 j | 2.2 − 1.6j |
| z₂ = (−1+j√3)⁴ | −8 + 8√3 j | −8 + 13.8564j |
| z̄₁ | 11/5 + 8/5 j | 2.2 + 1.6j |
| Re z₁ | 11/5 | 2.2 |
| Im z₂ | 8√3 | 13.8564 |
| \|4√3 − 8j\| | 4√7 | 10.5830 |
| arg(6j − 6) | 3π/4 | 2.3562 rad = 135° |

**Uwaga:** piszemy `1i`, a nie samo `i` — gdy raz przypiszesz `i = 5`, jednostka urojona przestaje działać.
W wersji symbolicznej wygodnie jest wprowadzić `u = sym(1i)` i używać `u`.
`angle` daje wynik w radianach; stopnie: `rad2deg(angle(...))`.

---

## Z3. Wszystkie pierwiastki 8. stopnia z z₀ = 48 − 64j

Wzór: `w_k = |z₀|^(1/8) · e^( j(φ+2πk)/8 )`, k = 0,…,7, gdzie φ = arg z₀.

**Kod:**

```matlab
z0 = 48-64*sym(1i);
k  = 0:7;                                       % numery pierwiastków
w  = z0^(sym(1)/8)*exp(2*sym(pi)*1i*k/8)        % symbolicznie
double(w)                                       % numerycznie
abs(w)                                          % moduł każdego = 80^(1/8)
```

**Wyniki:** |z₀| = 80, więc r = 80^(1/8) ≈ **1.72936**, φ = −atan(4/3) ≈ **−0.92730 rad** (−53.13°).

| k | pierwiastek |
|---|---|
| 0 | 1.71776 − 0.20001j |
| 1 | 1.35606 + 1.07321j |
| 2 | 0.20001 + 1.71776j |
| 3 | −1.07321 + 1.35606j |
| 4 | −1.71776 + 0.20001j |
| 5 | −1.35606 − 1.07321j |
| 6 | −0.20001 − 1.71776j |
| 7 | 1.07321 − 1.35606j |

**Uwaga:** pierwiastki leżą na okręgu co 45° (2π/8). Kontrola poprawności: `simplify(w.^8)`
powinno dać `48-64j` dla każdego pierwiastka. Ostrzeżenie: samo `z0^(1/8)` daje **jeden**
pierwiastek — mnożenie przez `exp(2πjk/8)` daje wszystkie osiem.

**Wersja „na skróty”** (bez wzoru de Moivre’a):

```matlab
syms z
double(solve(z^8 == 48-64j, z))     % MATLAB sam poda wszystkie 8 pierwiastków
```

---

## Z4. Równanie x⁴ + ax³ + bx² + c = 0 i rozkład na czynniki

Cyfry są indywidualne. Poniżej przykład dla daty **11.05.1995** → cyfry **1, 9, 5**.

**Kod:**

```matlab
syms x a b c
W = x^4 + a*x^3 + b*x^2 + c;               % postać ogólna
w = subs(W, [a b c], [1 9 5])              % <<< TU WPISZ SWOJE 3 RÓŻNE CYFRY
r = solve(w, x)                            % rozwiązania dokładne (długie)
double(r)                                  % rozwiązania numeryczne
factor(w, x, 'FactorMode', 'real')         % rozkład nad R
factor(w, x, 'FactorMode', 'complex')      % rozkład nad C
vpa(factor(w, x, 'FactorMode', 'real'), 6)     % czytelniej (6 cyfr)
```

**Wyniki dla x⁴ + x³ + 9x² + 5:**

* pierwiastki: `-0.537257 ± 2.864014j`, `0.0372573 ± 0.766456j`
* nad ℝ: `(x^2 + 1.07451x + 8.49122)(x^2 - 0.0745147x + 0.588843)`
* nad ℂ: `(x + 0.537257 - 2.86401j)(x + 0.537257 + 2.86401j)(x - 0.0372573 - 0.766456j)(x - 0.0372573 + 0.766456j)`

**Uwagi:**

* Rozwiązanie **ogólne** (z literami a, b, c) też istnieje (`solve(W,x)`), ale zajmuje kilka ekranów —
  dlatego podstawiamy cyfry i dopiero potem rozwiązujemy.
* `solve` daje wynik dokładny (z pierwiastnikami) → `double(...)` lub `vpa(...,6)` to „ogarnia”.
* Wariant numeryczny bez symboli: `roots([1 1 9 0 5])` — pamiętaj o **zerze** przy x
  (współczynniki: x⁴, x³, x², x¹, x⁰). Gdyby cyfry były inne, wektor zmienia się odpowiednio.
* Nad ℝ dostajesz dwa czynniki kwadratowe (nierozkładalne), nad ℂ cztery czynniki liniowe.

---

## Z5. Funkcja wymierna na sumę ułamków prostych

**Kod:**

```matlab
syms x
f(x) = 49*x^6/((x-2)^3*(x^4-3*x^2+9));
partfrac(f(x), x)                                % nad R (domyślnie)
partfrac(f(x), x, 'FactorMode', 'full')          % nad C
vpa(partfrac(f(x), x, 'FactorMode', 'full'), 6)  % czytelniej
```

**Wynik nad ℝ (5 składników):**

```
   147*(x - 3)          147*(89*x + 159)        60368          59584          3136
  -------------  +  ----------------------  -  ---------  +  -----------  +  -----------
  2*(x^2-3x+3)      4394*(x^2 + 3*x + 3)       2197*(x-2)    169*(x-2)^2    13*(x-2)^3
```

**Wynik nad ℂ (7 składników)** — dodatkowo rozbijają się oba trójmiany, bo
x⁴ − 3x² + 9 = (x² − 3x + 3)(x² + 3x + 3), a każdy z nich ma pierwiastki zespolone
x = ±3/2 ± (√3/2)j. Część z `(x-2)^3` jest ta sama, a cztery nowe ułamki mają postać

```
  147/4 + (147√3/4)j           147/4 - (147√3/4)j
 ----------------------  +  ----------------------      (bieguny x = 3/2 ± (√3/2)j)
 x - 3/2 - (√3/2)j          x - 3/2 + (√3/2)j

   1.48873 - 0.492535j          1.48873 + 0.492535j
 ----------------------  +  ----------------------      (bieguny x = -3/2 ± (√3/2)j)
 x + 3/2 - (√3/2)j          x + 3/2 + (√3/2)j
```

**Uwaga:** mianownik `x^4-3x^2+9` rozkłada się już nad ℚ na dwa trójmiany kwadratowe,
dlatego domyślne `partfrac` od razu daje pięć ładnych ułamków o rzeczywistych współczynnikach. Opcja `'FactorMode','full'`
rozbija wszystko do liniowych (zespolonych) mianowników — tak jak wymaga zadanie.

---

## Najczęstsze pułapki (skrót)

1. `sym` **wewnątrz** działania (`sqrt(sym(52))`), nie na gotowym przybliżeniu (`sym(sqrt(52))`).
2. Nie używać `i`, `j` jako nazw zmiennych — jednostka urojona to `1i`, `1j`.
3. Po `hold on` zawsze `hold off`, inaczej kolejne wykresy (w Lab_1) lądują na starym rysunku.
4. `roots` wymaga **wszystkich** współczynników, także zerowych.
5. `solve` zwraca wynik dokładny — do czytania używaj `double` / `vpa`.
