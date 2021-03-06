% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ergm_model.R, R/is.curved.R, R/is.durational.R,
%   R/is.dyad.independent.R, R/nparam.R, R/param_names.R
\name{ergm_model}
\alias{ergm_model}
\alias{c.ergm_model}
\alias{as.ergm_model}
\alias{as.ergm_model.ergm_model}
\alias{as.ergm_model.formula}
\alias{is.curved.ergm_model}
\alias{is.durational.ergm_model}
\alias{is.dyad.independent.ergm_model}
\alias{nparam.ergm_model}
\alias{param_names.ergm_model}
\title{Internal representation of an \code{ergm} network model}
\usage{
ergm_model(formula, nw = NULL, response = NULL, silent = FALSE,
  role = "static", ..., term.options = list())

\method{c}{ergm_model}(...)

as.ergm_model(x, ...)

\method{as.ergm_model}{ergm_model}(x, ...)

\method{as.ergm_model}{formula}(x, ...)

\method{is.curved}{ergm_model}(object, ...)

\method{is.durational}{ergm_model}(object, ...)

\method{is.dyad.independent}{ergm_model}(object, ...)

\method{nparam}{ergm_model}(object, canonical = FALSE, offset = NA,
  byterm = FALSE, ...)

\method{param_names}{ergm_model}(object, canonical = FALSE, ...)
}
\arguments{
\item{formula}{An \code{\link[=ergm]{ergm()}}
formula of the form \code{network ~ model.term(s)} or \code{~
model.term(s)}.}

\item{nw}{The network of interest; if passed, the LHS of \code{formula} is ignored. This is the recommended usage.}

\item{response}{Name of the edge attribute whose value is to be
modeled in the valued ERGM framework. Defaults to \code{NULL} for
simple presence or absence, modeled via a binary ERGM.}

\item{silent}{logical, whether to print the warning messages from the
initialization of each model term.}

\item{role}{A hint about how the model will be used. Used primarily for
dynamic network models.}

\item{\dots}{additional parameters for model formulation}

\item{term.options}{a list of optional settings such as calculation tuning options to be passed to the \code{InitErgmTerm} functions.}

\item{x}{object to be converted to an \code{ergm_model}.}

\item{object}{An \code{ergm_model} object.}

\item{canonical}{Whether the canonical (eta) parameters or the curved (theta) parameters are used.}

\item{offset}{If \code{NA} (the default), all model terms are counted;
if \code{TRUE}, only offset terms are counted; and if
\code{FALSE}, offset terms are skipped.}

\item{byterm}{Whether to return a vector of the numbers of
coefficients for each term.}
}
\value{
\code{ergm_model} returns an  \code{ergm_model} object as a list
containing:
\item{ formula}{the formula inputted to
\code{\link{ergm_model}}}
\item{coef.names}{a vector of coefficient names}
\item{offset}{a logical vector of whether each term was "offset", i.e.
fixed}
\item{terms}{a list of terms and 'term components' initialized by the
appropriate \code{InitErgmTerm.X} function.}
\item{network.stats0}{NULL always??}
\item{etamap}{the theta -> eta mapping as a list returned from
<ergm.etamap>}
}
\description{
These methods are generally not called directly by users, but may
be employed by other depending packages.
\code{ergm_model} constructs it from a formula. Each term is
initialized via the \code{InitErgmTerm} functions to create a
\code{ergm_model} object.
}
\section{Methods (by generic)}{
\itemize{
\item \code{c}: A method for concatenating terms of two or more initialized models.

\item \code{is.curved}: Tests whether the model is curved.

\item \code{is.durational}: Test if the model has duration-dependent terms, which call for \link{lasttoggle} data structures.

\item \code{is.dyad.independent}: Tests whether the model is dyad-independent.

\item \code{nparam}: Number of parameters of the model.

\item \code{param_names}: Parameter names of the model.
}}

\note{
This API is not to be considered fixed and may change between versions. However, an effort will be made to ensure that the methods of this class remain stable.
}
\seealso{
\code{\link[=summary.ergm_model]{summary.ergm_model()}}
}
