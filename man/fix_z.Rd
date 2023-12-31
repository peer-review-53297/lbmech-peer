% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fix_z.R
\name{fix_z}
\alias{fix_z}
\title{Define the sampling grid}
\usage{
fix_z(proj, res = 5, dx = 0, dy = 0)
}
\arguments{
\item{proj}{A \code{\link[raster]{crs}} object or character string containing
projection information. Should be conformal and in meters.}

\item{res}{A numeric of length one or two nrepresenting the spatial resolution.
Default is 5.}

\item{dx}{The horizontal offset from the origin (see \code{\link[raster]{origin}}).
Default is 0 (this does not correspond to an origin of zero however).}

\item{dy}{The vertical offset from the origin (see \code{\link[raster]{origin}}).
Default is 0 (this does not correspond to an origin of zero however).}
}
\value{
A SpatRaster object consisting of four cells, with resolution \code{res} and
 the origin at \code{x = nx} and \code{y = ny}.
}
\description{
Create a raster that can be used to define
the resolution, origin, and projection to be 
employed for all least-cost analyses. If a source
DEM has such properties you may use that.
}
\examples{
projection <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +datum=WGS84"
z_fix <- fix_z(res = 2, proj = projection)
}
