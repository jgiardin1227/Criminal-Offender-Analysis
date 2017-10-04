# No 1&2

n=50
mu=20
sigma=3

s2=0
s2prime=0
s2star=0

for(i in 1:1000)
{
  mysample=rnorm(n, mu, sigma)
  xbar=mean(mysample)
  
  s2[i]=(sum((mysample-xbar)^2))/(n-1)
  s2prime[i]=(sum((mysample-xbar)^2))/n
  s2star[i]=(sum((mysample-xbar)^2))/(n+1)
}

bias_s2=mean(s2)-sigma^2
bias_s2prime=mean(s2prime)-sigma^2
bias_s2star=mean(s2star)-sigma^2

var_s2=var(s2)
var_s2prime=var(s2prime)
var_s2star=var(s2star)

mse_s2=bias_s2^2+var_s2
mse_s2prime=bias_s2prime^2+var_s2prime
mse_s2star=bias_s2star^2+var_s2star


# No 3 - beta
# rpois, rbeta, rexp

# No 3 - beta

n=50
alpha=2
beta=3
dist_var=(alpha*beta)/((alpha+beta+1)*(alpha+beta)^2)

s2=0
s2prime=0
s2star=0

for(i in 1:1000)
{
  mysample=rbeta(n, alpha, beta)
  xbar=mean(mysample)
  
  s2[i]=(sum((mysample-xbar)^2))/(n-1)
  s2prime[i]=(sum((mysample-xbar)^2))/n
  s2star[i]=(sum((mysample-xbar)^2))/(n+1)
}

bias_s2=mean(s2)-dist_var
bias_s2prime=mean(s2prime)-dist_var
bias_s2star=mean(s2star)-dist_var

var_s2=var(s2)
var_s2prime=var(s2prime)
var_s2star=var(s2star)

mse_s2=bias_s2^2+var_s2
mse_s2prime=bias_s2prime^2+var_s2prime
mse_s2star=bias_s2star^2+var_s2star

# No 3 - uniform

n=50
min=0
max=1

s2=0
s2prime=0
s2star=0

for(i in 1:1000)
{
  mysample=runif(n, min, max)
  xbar=mean(mysample)
  
  s2[i]=(sum((mysample-xbar)^2))/(n-1)
  s2prime[i]=(sum((mysample-xbar)^2))/n
  s2star[i]=(sum((mysample-xbar)^2))/(n+1)
}

bias_s2=mean(s2)-(max-min)^2/12
bias_s2prime=mean(s2prime)-(max-min)^2/12
bias_s2star=mean(s2star)-(max-min)^2/12

var_s2=var(s2)
var_s2prime=var(s2prime)
var_s2star=var(s2star)

mse_s2=bias_s2^2+var_s2
mse_s2prime=bias_s2prime^2+var_s2prime
mse_s2star=bias_s2star^2+var_s2star


# No 3 - binomial

n=50
size=12
p=.6
dist_var=size*p*(1-p)

s2=0
s2prime=0
s2star=0

for(i in 1:1000)
{
  mysample=rbinom(n, size, p)
  xbar=mean(mysample)
  
  s2[i]=(sum((mysample-xbar)^2))/(n-1)
  s2prime[i]=(sum((mysample-xbar)^2))/n
  s2star[i]=(sum((mysample-xbar)^2))/(n+1)
}

bias_s2=mean(s2)-dist_var
bias_s2prime=mean(s2prime)-dist_var
bias_s2star=mean(s2star)-dist_var

var_s2=var(s2)
var_s2prime=var(s2prime)
var_s2star=var(s2star)

mse_s2=bias_s2^2+var_s2
mse_s2prime=bias_s2prime^2+var_s2prime
mse_s2star=bias_s2star^2+var_s2star


#normal
n=100
mu=20
sigma=3

s=0

for(i in 1:1000)
{
  mysample=rnorm(n,mu,sigma)
  xbar=mean(mysample)
  
  s[i]=((sum((mysample-xbar)^2))/(n-1))^(1/2)
}

bias_s=mean(s)-sigma


#beta
n=100
mu=20
sigma=3

s=0

for(i in 1:1000)
{
  mysample=rbeta(n, alpha, beta)
  xbar=mean(mysample)
  
  s[i]=((sum((mysample-xbar)^2))/(n-1))^(1/2)
}

bias_s=mean(s)-sigma



