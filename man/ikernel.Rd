% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{ikernel}
\alias{ikernel}
\title{A wraper to build different kinds of correlation matrices between two sets of inputs}
\usage{
ikernel(input1, input2, range, tail, nu, covmodel, dtype = "Euclidean")
}
\arguments{
\item{input1}{a matrix of input locations}

\item{input2}{a matrix of input locations}

\item{range}{a vector of range parameters, which could be a scalar.}

\item{tail}{a vector of tail decay parameters, which could be a scalar.}

\item{nu}{a vector of smoothness parameters, which could be a scalar.}

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

\item{dtype}{a string indicating distance type: \strong{Euclidean}, \strong{GCD}, where the latter indicates great circle distance.}
}
\value{
a correlation matrix
}
\description{
This function wraps existing built-in routines to construct a covariance 
matrix for two input matrices based on data type, covariance type, and distance type. The constructed 
covariance matrix can be directly used for GaSP fitting and and prediction for spatial 
data, spatio-temporal data, and computer experiments. This function explicitly takes inputs as arguments. 
The prefix ``i" in \code{\link{ikernel}} standards for ``input".
}
\examples{
input = seq(0,1,length=10)

cormat = ikernel(input,input,range=0.5,tail=0.2,nu=2.5,
         covmodel=list(family="CH",form="isotropic"))

}
\seealso{
\code{\link{CH}}, \code{\link{matern}}, \code{\link{kernel}}, \link{GPBayes-package}, \code{\link{GaSP}}
}
\author{
Pulong Ma \email{mpulong@gmail.com}
}
