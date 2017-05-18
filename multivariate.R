require(rstan)
require(MASS)
normal <- "
	data {		
   int <lower=1> N;
   vector[N] mu;
   vector[N] y;
	}
	parameters {
  real mu0;
  real<lower=0> sigma2;
  real<lower=0> sigma20;
	}
	transformed parameters {
  cov_matrix[N] newsigma ~ sigma20*diag_matrix(y); 
	}
	model {
  sigma2 ~ inv_gamma(1,1);
  mu ~ normal(mu0,newsigma);
  y ~ normal(mu,newsigma);
  
}"

D <- 10
mu <- rnorm(D) + 10
sigma2 <- 5
n <- 100
y <- mvrnorm(n, mu , sigma2*diag(D))
data <- list(y=y, n=n, D=D)
m <- stan_model(model_code = normal)
samples <- sampling(m, data=data, iter=1000, chains=1)
mu <- colMeans(extract(samples)$mu)
sigma2 <- mean(extract(samples)$sigma2)


