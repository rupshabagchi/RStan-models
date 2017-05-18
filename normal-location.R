require(rstan) 
normal <- "
	data {	
   int <lower=1> N;
   vector[N] y;
	}
	parameters {
  real mu;
  real mu0;
  real<lower=0> sigma;
	}
	model {
  mu ~ normal(mu0, sigma);
	y ~ normal(mu, sigma);
	}"

mu <- 10
n <- 100
y <- rnorm(N, 10, 3)
data <- list(y=y, n=n)
m <- stan_model(model_code = normal)
samples <- sampling(m, data=data, iter=1000, chains=1)
mu <- mean(extract(samples)$mu)
