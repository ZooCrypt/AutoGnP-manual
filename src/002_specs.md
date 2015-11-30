<p class="halfbreak">
</p>

Specifying security experiments
===============================

Types
-----

The following types are supported:

* `Bool`: a boolean value
* `Fq`: Elements of the prime-field of order `q` for a fixed,
  but arbitrary prime `q`
* `G` and `G_gid`: Elements of a cyclic group of order `q`.
  The group identifier `gid` can be a number or a lowercase
  alpha-numeric identifier (e.g., `1`, `s`, `t`, `s1`, `s2`, ...)
* `BS_lid`: Fixed-length bitstrings.
  The length identifier `lid` must be alpha-numeric
  (e.g., `l`, `k`, `l1`, ...).
* `T1 * T2`: the cartesian product of the types `T1` and `T2`.
* `()`: The unit type which can be interpreted as the empty
   cartesian product.
* `KeyPair_pid`, `PKey_pid`, `SKey_pid`: The types of key pairs,
  public keys, and secret keys for the permutation family denoted
  with `pid`. The permutation identifier `pid` must be alpha-numeric.

Expressions
-----------

Adversary declarations
----------------------

Assumption declarations
-----------------------

Computational assumption:

Decisional assumption:

Security Experiments
--------------------

Main function:

* `let x = e`:
* `x <-$ T`:
* `assert (cond)`:
* `x <- A(e1,...,ek) with OD1, ..., OD2`:

Oracle definition:

* `let x = e`:
* `x <-$ T`:
* `guard (cond)`:
* `return e`:

Probability Judgments
---------------------

* `bound_adv  [ cmds ]  : ev`:
* `bound_succ [ cmds ]  : ev`:
* `bound_dist [ cmds1 ] : ev1 [ cmds2 ] : ev2`:
