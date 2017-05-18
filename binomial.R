require(rstan)
binomial <- "
	data {
   
   int <lower=0> s;
   int <lower=1> N;
   int <lower=0> y[N];
	}
	parameters {
   real <lower=0> theta;
	}
	model { 
   theta ~ beta(1,1);
    y ~ binomial(s,theta);
	}"

N <- 100
s <- 10 #number of trials
theta <- .4
y <- rbinom(N, s, theta)
data <- list(y=y, N=N, s = s)
m <- stan_model(model_code = binomial)
samples <- sampling(m, data=data, iter=1000, chains=1)
theta <- mean(extract(samples)$theta)
