<p class="halfbreak">
</p>

Example
=======

Before explaining all the constructs in detail, we perform a very simple
cryptographic proof to illustrate the concepts. We use the hello-world
example of game-based proofs: $\IndCpa$ security of El-Gamal encryption.

Defining IND-CPA security of El-Gamal encryption
------------------------------------------------

Before starting with the definitions and the proof in $\autognp$, we
give the definitions and a proof sketch as they would appear in a
crypto textbook. The El-Gamal encryption scheme uses a cyclic group
$\GG$ and we assume the decisional Diffie-Hellman problem is hard in
this group. Namely, for all *efficient* adversaries $\AdvDDH$, it is
*hard* to distinguish the triple $(g^a, g^b, g^{ab})$ from the triple
$(g^a, g^b, g^c)$. Formally, this means we assume that the
following quantity is low:

$$
\left|
\ProbGame{
  \samp{a,b}{\Fq}  \\
  \call{b}{\AdvDDH(g^a,g^b,g^{ab})}
}{
  b = 1
}
-
\ProbGame{
  \samp{a,b,c}{\Fq}  \\
  \gets{b}{\AdvDDH(g^a,g^b,g^c)}
}{
  b = 1
}
\right|
$$

A public key encryption scheme consists of three algorithms $\pkeyGen$,
$\penc$, and $\pdec$ where the first two are usually probabilistic.

**FIXME**: Explain correctness, explain $\IndCpa$, give informal proof. 

We first define the assumption.

~~~~ {.autognp slice="code/001_El-Gamal.zc" lower=2 upper=6}
~~~~

Declare adversary `A_dhh` used in assumption, then give left and right
game.

Next, we define the experiment.

~~~~ {.autognp slice="code/001_El-Gamal.zc" lower=8 upper=23}
~~~~

Bounding the winning probability
--------------------------------

We can perform a fully automated proof.

~~~~ {.autognp slice="code/001_El-Gamal.zc" lower=24 upper=24}
~~~~

Or we can perform a mostly manual proof.

~~~~ {.autognp slice="code/001_El-Gamal.zc" lower=28 upper=37}
~~~~

