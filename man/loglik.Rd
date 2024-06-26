% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{loglik}
\alias{loglik}
\title{A wraper to compute the natural logarithm of the integrated likelihood function}
\usage{
loglik(par, output, H, d, covmodel, smooth, smoothness_est)
}
\arguments{
\item{par}{a numerical vector, with which numerical optimization routine such as \code{\link[stats]{optim}} can be
carried out directly. When the confluent Hypergeometric class is used, it is used to hold values 
for \strong{range}, \strong{tail}, \strong{nugget}, and \strong{nu} if the smoothness parameter is estimated.
When the Matérn class or powered-exponential class is used, it is used to hold values
for \strong{range}, \strong{nugget}, and \strong{nu} if the smoothness parameter is estimated.
The order of the parameter values in \code{par} cannot be changed. For tensor or ARD form correlation
functions, \strong{range} and \strong{tail} becomes a vector.}

\item{output}{a matrix of outputs}

\item{H}{a matrix of regressors in the mean function of a GaSP model.}

\item{d}{an R object holding the distances. It should be a distance matrix for constructing isotropic correlation matrix,
or a list of distance matrices along each input dimension for constructing tensor or ARD types of correlation matrix.}

\item{covmodel}{a list of two strings: \strong{family}, \strong{form}, where \strong{family} indicates the family of covariance functions 
including the Confluent Hypergeometric class, the Matérn class, the Cauchy class, the powered-exponential class. \strong{form} indicates the 
specific form of covariance structures including the isotropic form, tensor form, automatic relevance determination form. 
\describe{
\item{\strong{family}}{
\describe{
\item{CH}{The Confluent Hypergeometric correlation function is given by 
\deqn{C(h) = \frac{\Gamma(\nu+\alpha)}{\Gamma(\nu)} 
\mathcal{U}\left(\alpha, 1-\nu, \left(\frac{h}{\beta}\right)^2\right),}
where \eqn{\alpha} is the tail decay parameter. \eqn{\beta} is the range parameter.
\eqn{\nu} is the smoothness parameter. \eqn{\mathcal{U}(\cdot)} is the confluent hypergeometric
function of the second kind. For details about this covariance, 
see Ma and Bhadra (2023; \doi{10.1080/01621459.2022.2027775}).  
}
\item{cauchy}{The generalized Cauchy covariance is given by
\deqn{C(h) = \left\{ 1 + \left( \frac{h}{\phi} \right)^{\nu}  
            \right\}^{-\alpha/\nu},}
where \eqn{\phi} is the range parameter. \eqn{\alpha} is the tail decay parameter.
\eqn{\nu} is the smoothness parameter with default value at 2.
}

\item{matern}{The Matérn correlation function is given by
\deqn{C(h)=\frac{2^{1-\nu}}{\Gamma(\nu)} \left( \frac{h}{\phi} \right)^{\nu} 
\mathcal{K}_{\nu}\left( \frac{h}{\phi} \right),}
where \eqn{\phi} is the range parameter. \eqn{\nu} is the smoothness parameter. 
\eqn{\mathcal{K}_{\nu}(\cdot)} is the modified Bessel function of the second kind of order \eqn{\nu}.
}
\describe{
\item{exp}{This is the Matérn correlation with \eqn{\nu=0.5}. This covariance should be specified as \strong{matern} with smoothness parameter \eqn{\nu=0.5}.
}
\item{matern_3_2}{This is the Matérn correlation with \eqn{\nu=1.5}.
This covariance should be specified as \strong{matern} with smoothness parameter \eqn{\nu=1.5}.}
\item{matern_5_2}{This is the Matérn correlation with \eqn{\nu=2.5}. 
This covariance should be specified as \strong{matern} with smoothness parameter \eqn{\nu=2.5}.}
}


\item{powexp}{The powered-exponential correlation function is given by
               \deqn{C(h)=\exp\left\{-\left(\frac{h}{\phi}\right)^{\nu}\right\},}
where \eqn{\phi} is the range parameter. \eqn{\nu} is the smoothness parameter.
}
\item{gauss}{The Gaussian correlation function is given by 
\deqn{C(h)=\exp\left(-\frac{h^2}{\phi^2}\right),}
where \eqn{\phi} is the range parameter.
 }
}
}

\item{\strong{form}}{
\describe{
 \item{isotropic}{This indicates the isotropic form of covariance functions. That is,
 \deqn{C(\mathbf{h}) = C^0(\|\mathbf{h}\|; \boldsymbol \theta),} where \eqn{\| \mathbf{h}\|} denotes the 
Euclidean distance or the great circle distance for data on sphere. \eqn{C^0(\cdot)} denotes 
any isotropic covariance family specified in \strong{family}.}
 \item{tensor}{This indicates the tensor product of correlation functions. That is, 
\deqn{ C(\mathbf{h}) = \prod_{i=1}^d C^0(|h_i|; \boldsymbol \theta_i),}
where \eqn{d} is the dimension of input space. \eqn{h_i} is the distance along the \eqn{i}th input dimension. This type of covariance structure has been often used in Gaussian process emulation for computer experiments.
}
 \item{ARD}{This indicates the automatic relevance determination form. That is, 
\deqn{C(\mathbf{h}) = C^0\left(\sqrt{\sum_{i=1}^d\frac{h_i^2}{\phi^2_i}}; \boldsymbol \theta \right),}
where \eqn{\phi_i} denotes the range parameter along the \eqn{i}th input dimension.}
 }
}

}}

\item{smooth}{The smoothness parameter \eqn{\nu} in a correlation function.}

\item{smoothness_est}{a logical value indicating whether the smoothness parameter is estimated.}
}
\value{
The natural logarithm of marginal or integrated likelihood
}
\description{
This function wraps existing built-in routines to construct  
the natural logarithm of the integrated likelihood function. The constructed 
loglikelihood can be directly used for numerical optimization
}
\seealso{
\code{\link{CH}}, \code{\link{matern}}, \code{\link{gp.optim}}, \link{GPBayes-package}, \code{\link{GaSP}}
}
\author{
Pulong Ma \email{mpulong@gmail.com}
}
