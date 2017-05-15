require(rstan)
normal <- "
	data {
   int <lower=1> N;
   vector[N] y;
	}
	parameters {
  real mu;
  real mu0;
  real<lower=0> sigma0;
  real<lower=0> sigma2;
  real<lower=0> sigma20;
	}
  transformed parameters {
  real<lower=0> sigma;
  ##sigma = sqrt(sigma2);
	}
	model {
  sigma ~ cauchy(mu0,sigma0);
  sigma ~ lognormal(mu0,sigma20);
  sigma2 ~ inv_gamma(1,1);
  mu ~ normal(mu0,sigma20);
  y ~ normal(mu,sigma2);
	}"

mu <- 10
sigma <- 5
n <- 100
y <- rnorm(n, mu, sigma)
data <- list(y=y, n=n)
m <- stan_model(model_code = normal)
samples <- sampling(m, data=data, iter=1000, chains=1)
mu <- mean(extract(samples)$mu)
sigma2 <- mean(extract(samples)$sigma2)


