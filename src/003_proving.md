<p class="halfbreak">
</p>

Proving probability bounds
==========================

We have already seen the proof of the El-Gamal encryption scheme.
Since we used the fully automated `bycrush` tactic to perform the proof,
it was not very instructive and we did not get a chance to learn about
the support for interactive proofs, which is required for larger examples.

We distinguish between four types of tactics:

* Bridging tactics
* Tactics for random sampling
* Reductions to cryptographic assumptions
* Conditional equivalence

Bridging tactics
----------------

Bridging tactics transform the focused game and event `G : E`
  into an equivalent game and event `G' : E'`.
They work with all types of judgments.

The following bridging tactics are documented below:

* `move i j`: Moves the line at position `i` to position `j`.
* `unfold i`: Unfolds the `let`-binding at position `i`.
* `abstract i x e`: Introduces the `let`-binding `let x = e` at
   position `i`.
* `abstract* i x e`: Introduces the `let`-binding `let x = e` at
  position `i` and tries to express the remainder of the game
  using only `x` and variables defined at positions greater
  than `i`.
* `norm`: Rewrites all expressions in the game into a certain
  normal form.
* `rename var1 var2`: Renames the variable `var1` to `var2`.
* `simp`: Simplifies the game by **FIXME**.

### List of tactics

#### `move pos new_pos`:

Moves the command at position `pos` to the new position `new_pos`.
The first argument `pos` is either a
  line number `i` in the main body, 
  a triple `(i,j,k)` describing a line number in an oracle,
  or a variable name `x`.
A number `i` refers to the `i`-th line starting with `1` for the
  first line.
A triple `(i,j,k)` refers to the `k`-th line in the `j`-th oracle
  used in the adversary call in the `i`-th line.
A variable name `x` refers to the line where `x` is defined.

The second argument `new_pos` is either
  a line number `i` in the main body,
  a positive offset `+i` or a negative offset `-i`,
  or a variable name `x`.
If the original position is inside an oracle, then only
  offsets are allowed.

__Example invocations__:

```
move 2 1          (* swap line 2 to position 1 *)
move 3 -2         (* swap line 3 to position 1 = 3 - 2 *)
move x 1          (* swap line where x is defined to position 1 *)
move (10,1,1) +1  (* swap in oracle *)
```

As a shorthand, it is also possible to give a range `[pos1 pos2]`
as the first argument. In this case, the corresponding lines are
all moved to `new_pos`


```
move [3 5] +5  (* equiv. to: move 3 +1. move 4 +1. move 5 +1. *)
```

We will later also explain the `move_main` tactic which 
can be used in hybrid arguments.

#### `unfold pos`:

Unfolds the let-binding at position `pos`. The `unfold` tactic
  accepts the same position specifications as `move`.
If no position is given, all let-bindings are unfolded.

__Example invocations__:

```
unfold v
unfold 2
unfold (2,3,1)
unfold
```

#### `abstract pos var expr`:

Introduces a let abstraction `let var = expr` at position
  `pos` and replaces all occurences of `expr` after `pos`
  by `var`.

__Example invocations__:

```
abstract 4  arg (i,g^r1,g^r2).1
abstract 10 res (b = b').
abstract _  res _.
```

#### `abstract* pos var expr`

The `abstract*` rule is very similar to abstract, but
  uses a more powerful method to replace occurences of `expr`
  by `var`.

There is also a variant `abstract*!` that does not fail if an
  command cannot be expressed using `var`.

__Example invocations__:

```
abstract* 4 arg (g^e', g^c, g^d, e(g,g)^(e'*c*d))
```

#### `norm`:

The standard `norm` function unfolds all let-bindings and rewrites
expressions into a normal form such that no cancellation rules
are applicable and all group element in group `G_i` expressed
as `g_i^f` where `f` is a field expression. This might introduce
unneeded `log` applications.

The rules has several variants:

* `norm_nounfold`: Do not unfold let-bindings
* `norm_unknown var1 ... vark`:
* `norm_solve var`:

__Example invocations__:

```
norm
norm_nounfold
norm_unknown
norm_unknown r1 r2
norm_solve h
```

There are also shortcuts for these different norm variants:

```
//.
//=.
///=.
```
#### `rename var1 var2`

Renames the variable `var1` to `var2`.

#### `simp`:

Simplifies using tests in oracles and other things.


Tactics for random sampling
---------------------------

#### `except var exprs`:

__Example invocations__:

```
except a [].
except a [0].
except a [b].
```

#### `rnd`:


```
rnd w (w -> w - e1) (w -> w + e1)
rnd w (w -> w - e1) _
rnd w _             (w -> w + e1)
rnd y _             _             e  (* FIXME: check this *)
rnd z _             _
```

```
rnd! w (w -> w - e1) (w -> w + e1)
rnd! w (w -> w - e1) _
rnd! w _             (w -> w + e1)
rnd! y _             _             e  (* FIXME: check this *)
rnd! z _             _
```

Mention type switch possible for bijection.

```
rnd K1 (...) (...) (* desugar the following rnd_exp *)
rnd_exp (K1 k1).
rnd_exp V V1 V2 W U H.
```

In oracle:

```
rnd (11,1,6) (gamma -> gamma + c1) _.
```

Reductions to cryptographic assumptions
---------------------------------------

Computational assumptions:

```
assumption_computational cma1 [2 14] [15 19].
assumption_computational tcr [4 16].
assumption_computational cma0 [2].
assumption_computational! tcr.
```

Decisional assumptions:

```
assumption_decisional! kdf -> km ks.
assumption_decisional dbdh -> [arg] tt.
assumption_decisional kdf  -> [arg] km ks.
```


Conditional equivalence
-----------------------

Dealing wih events
------------------

```
case_ev (u1,u2) = (g ^ (r1*e1),g ^ (e1*r2*w)).
```

```
ctxt_ev 1 (x -> x^(1/a)).
```

```
split_ineq 2.
```

```
remove_ev 1.
remove_ev 1 2 3.
```

Remaining rules
===============

```
assert beta (KeyGen1`i<>ci).

bycrush.
bysimp.

dist_eq.

dist_sym.

find (ai gr1 gr2 -> (((u1,u2) <> (gr1,gr2)) /\ (H(ai,u1,u2) = H(ai,gr1,gr2)))) (i,g^(r1*e1),g^(r2*e1*w)) C1 u1 u2 e t. //.
find (gu gv gz2 -> ((a,a',c) <> (gu,gv,gz2)) /\ (H(a,a',c) = H(gu,gv,gz2))) (g^{u},g^{v},g^{z2}) A3 a a' c d.

guard (10,1,2) (a^{w} = a').

guess A3 a a' c d.

indep!.

rewrite_oracle (10,1,1) <-.

(* * Transitivity *)

trans* [ insert beta' [x <-$ Fq; let C4' = g^(b*a2*x); let C5' = g^(a2*x); let C6' = V2^(a2*x); let C7' = V2^(b*a2*x); ] , subst E2 (C4 -> C4*C4') , subst E2 (C5 -> C5*C5') , subst E2 (C6 -> C6*C6') , subst E2 (C7 -> C7*C7')].
```