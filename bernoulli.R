require(rstan)
bernoulli <- "
	data { 
    int alpha;
    int beta;
    int <lower=0> N;
    int <lower=0,upper=1> y[N];
	} 
	parameters {
     real <lower=0,upper=1> theta;
	} 
	model {
    theta ~ beta(alpha,beta);
    y ~ bernoulli(theta);
	}"

N <- 100
y <- rbinom(N, 1, .4)
data <- list(y=y, N=N)
m <- stan_model(model_code = bernoulli)
samples <- sampling(m, data=data, iter=1000, chains=1)
mu <- mean(extract(samples)$theta)
print(mu)
