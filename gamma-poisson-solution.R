require(rstan)
poisson <- "
	data {
   int alpha;
   int beta;
   int <lower=1> N;
   int <lower=0> y[N];
	}
	parameters {
  real lambda;
	}
	model { 
  lambda ~ gamma(alpha,beta);
   y ~ poisson(lambda);
	}"


N <- 100
lambda <- 10
y <- rpois(N,lambda)
data <- list(y=y, N=N)
m <- stan_model(model_code = poisson)
samples <- sampling(m, data=data, iter=1000, chains=1)
lambda <- mean(extract(samples)$lambda)
