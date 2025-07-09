---
tags:
  - stats
  - ML
  - MLE
---
# Two group comparison
# More than two group comparison
## Covariate
Variables impact the dependent variable but not of interest

## ANOVA
compares the means of multiple groups to determine if there are any significant differences between them.
ANOVA compares the variances of each group mean to the overall group variance. It uses the F test to calculate the statistical significance of the differences.
one-way, two-way, and N-way

## Mixed effect
In [matrix notation](https://en.wikipedia.org/wiki/Matrix_notation#Notation "Matrix notation") a linear mixed model can be represented as

y=Xβ+Zu+ϵ

where

y!is a known vector of observations, with mean E(y)=Xβ![{\displaystyle E({\boldsymbol {y}})=X{\boldsymbol {\beta }}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/e80868378849f4243dd83136dbcd55f5bae55a0a);
β![{\displaystyle {\boldsymbol {\beta }}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/702cafc420cc00c54896f6d125112820956aaf6b) is an unknown vector of fixed effects;
u![{\displaystyle {\boldsymbol {u}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/3d60e374e33b2c1d75888c0e8759f9e770e718f7) is an unknown vector of random effects, with mean E(u)=0![{\displaystyle E({\boldsymbol {u}})={\boldsymbol {0}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/0fc9b89cf3bf8af31f308b852232ea1e164e06ec) and [variance–covariance matrix](https://en.wikipedia.org/wiki/Covariance_matrix "Covariance matrix") var⁡(u)=G![{\displaystyle \operatorname {var} ({\boldsymbol {u}})=G}](https://wikimedia.org/api/rest_v1/media/math/render/svg/92e7197d495b985e3b4908e414ecb60ef3d58d8b);
ϵ![{\displaystyle {\boldsymbol {\epsilon }}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/be3ff7747cde11092061b1cf99a03eb19bfeba31) is an unknown vector of random errors, with mean E(ϵ)=0![{\displaystyle E({\boldsymbol {\epsilon }})={\boldsymbol {0}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/6276da282871b9e361aa0a794c61d2fc059b77f1) and variance var⁡(ϵ)=R![{\displaystyle \operatorname {var} ({\boldsymbol {\epsilon }})=R}](https://wikimedia.org/api/rest_v1/media/math/render/svg/3172e3fd6b8283eae893b11d6b945d8d37f089a9);
X![{\displaystyle X}](https://wikimedia.org/api/rest_v1/media/math/render/svg/68baa052181f707c662844a465bfeeb135e82bab) is the known [design matrix](https://en.wikipedia.org/wiki/Design_matrix "Design matrix") for the fixed effects relating the observations y![{\displaystyle {\boldsymbol {y}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/ca3ae71d44145d721c4b15d442e03005e5ea9850) to β![{\displaystyle {\boldsymbol {\beta }}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/702cafc420cc00c54896f6d125112820956aaf6b), respectively
- Z![{\displaystyle Z}](https://wikimedia.org/api/rest_v1/media/math/render/svg/1cc6b75e09a8aa3f04d8584b11db534f88fb56bd) is the known [design matrix](https://en.wikipedia.org/wiki/Design_matrix "Design matrix") for the random effects relating the observations y![{\displaystyle {\boldsymbol {y}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/ca3ae71d44145d721c4b15d442e03005e5ea9850) to u![{\displaystyle {\boldsymbol {u}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/3d60e374e33b2c1d75888c0e8759f9e770e718f7), respectively.
- 
### Fixed effect
### Random effect
### Covariate
ANCOVA
**Analysis of covariance** (ANCOVA) is a method for comparing sets of data that consist of two variables (treatment and effect, with the effect variable being called the “variate”) when a third variable (called the “covariate”) exists.



# Power analysis
- Central limit theorem
- Effect size $$d = (\bar{x_2} - \bar{x_1})/ \sqrt{(s_1^2 + s_2^2) / 2} $$
- 