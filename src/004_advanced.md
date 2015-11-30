<p class="halfbreak">
</p>

Advanced techniques
===================

In this section, we will present some advanced proof techniques and
tactics that have not been mentioned in the earlier chapters.

Hybrid arguments
----------------

We will use the n-IND-Cpa security of El-Gamal as an example here.

```
(* ** move_main *)
move_main (12,1,5) B.

(* ** move_main *)
move_main tt (19,1,1) gamma.
move_main tt (22,1,1) gamma.

hybrid (19,1) { r1, r2, z1, z2, tagk, gamma <-$ Fq; let r = r2 + r1; let D1' = g^(a1*alpha) * V^r; let D2' = g^-alpha * V1^r * g^z1; let D3 = (g^b)^-z1; let D4' = V2^r * g^z2; let D5 = (g^b)^-z2; let D6 = g^(b*r2); let D7 = g^r1; let k = (H * U^i * W^tagk)^r1; let D1 = D1' * g^(-a1*a2*gamma); let D2 = D2' * g^(a2*gamma); let D4 = D4' * g^(a1*gamma); return (tagk,D1,D2,D3,D4,D5,D6,D7,k) }. 
hybrid (41,1) { i <> ci; r1, r2, z1, z2, tagk, gamma <-$ Fq; let r = r2 + r1; let D1' = g^(a1*alpha) * V^r; let D2' = g^-alpha * V1^r * g^z1; let D3 = (g^b)^-z1; let D4' = V2^r * g^z2; let D5 = (g^b)^-z2; let D6 = g^(b*r2); let D7 = g^r1; let k = (H * U^i * W^tagk)^r1; let D1 = D1' * g^(-a1*a2*gamma); let D2 = D2' * g^(a2*gamma); let D4 = D4' * g^(a1*gamma); return (tagk,D1,D2,D3,D4,D5,D6,D7,k) }.
```