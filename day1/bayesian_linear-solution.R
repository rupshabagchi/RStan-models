require(rstan)
bayesian_linear <- "
	data {
   int <lower=1> N;
   vector[N] mu;
   vector[N] y;
   vector[N] w;
	}
	parameters {
  vector[N] alpha;
  real<lower=0> sigma2;
  real<lower=0> sigma20;
	}
	transformed parameters {
  alphainverse ~ inv(alpha);
  
	}
	model {
  sigma2 ~ inv_gamma(1,1);
  w ~ normal(0,diag_matrix(alphainverse);
  y ~ normal(t(w)*x,sigma2);
	}"


tau <- 1
N <- 1000
D <- 10
w <- rnorm(D, sd = tau)
X <- matrix(rnorm(N*D), N, D)
y <- c(X %*% w + rnorm(N))
data <- list(N=N, D=D, X=X, y=y)

m <- stan_model(model_code = bayesian_linear)
samples <- sampling(m, data=data, iter=2000, chains=1)
w <- colMeans(extract(samples)$w)
tau <- mean(extract(samples)$tau)
