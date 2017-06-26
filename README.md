# RStan-models

STAN code using R, used to model data following the distributions mentioned below. A part of Unsupervised Machine Learning course.

## Bernoulli model  

	y∼Bern(θ)
	θ∼Beta(α,β)

## Binomial model

	y∼Bin(N,θ)
	θ∼Beta(α,β)

## Poisson-Gamma model

	y∼Poisson(λ)
	λ∼Gamma(α0,β0)

## Normal distribution with location

	y∼N(μ,σ20)
	μ∼N(μ0,σ20)

## Normal distribution with location and scale

	y∼N(μ,σ2)
	μ∼N(μ0,σ20)
	and, σ2∼InvGam(α0,β0)
	or, σ∼logNormal(μ0,σ20)
	or, σ∼Cauchy(μ0,σ0)

## Multivariate normal distribution with location and scale

	y∼N(μ,σ2I)
	μ∼N(μ0,σ20I)
	σ2∼InvGam(α0,β0)

## Bayesian linear regression

	τ∼Gam(α0,β0)
	σ2∼InvGam(α0,β0)
	w∼N(0,τ−1I)
	y∼N(w⊤x,σ2)
	K=number of dimensions

## Bayesian linear regression with ARD prior

	αi=1…K∼Gam(α0,β0)
	σ2∼InvGam(α0,β0)
	w∼N(0,α−1I)
	y∼N(w⊤x,σ2)
	K=number of dimensions


## PCA with ARD prior

	xn∼N(Wzn,τ−1ID)
	Wk|αk∼N(0,α−1kID)
	αk∼Gam(α0,β0)
	τ∼Gam(α0,β0)
	z∼N(0,IK)
	N=number of data points
	D=dimension of data point
	K=latent dimension

## Bayesian CCA

	x(m)n∼N(W(m)zn,(τ(m))−1I)
	W(m)k|α(m)k∼N(0,(αk)−1I)
	α(m)k∼Gamma(α0,β0)
	τ(m)∼Gamma(α0,β0)
	zn∼N(0,Ik)

## Bayesian CP factorization

	yn,d,l∼N(K∑k=1(xn,k⋅wd,k⋅ul,k),τ−1)
	xn,k∼N(0,1)
	ul,k∼N(0,1)
	wd,k∼N(0,α−1k)
	τ∼Gam(α0,β0)
	αk∼Gam(α0,β0)


