% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getData.R
\name{getData}
\alias{getData}
\title{Access specific datasets}
\usage{
getData(data, name = NULL, dir = tempdir(), timeout = 999)
}
\arguments{
\item{data}{A character string indicating the name of the dataset to access. See details below.}

\item{name}{For values of \code{data} that download data (see details), what will be the file/directory name of the
downloaded items?}

\item{dir}{Directory to which downloaded data will be saved. Default is \code{tempdior()}.}

\item{timeout}{How many seconds before downloads time out? Default is 999. Temporarily overrides value in \code{getOptions("timeout")}.}
}
\value{
Various, depending on \code{data} selection:

\code{data = 'baleares-currents'} returns a SpatRaster with ocean current surface velocities in m/s.

\code{data = 'baleares-gpx'} does not return any object, but creates a sub-directory \code{name} in directory \code{dir} with 15,373 GPX files,
of which 15,371 can be successfully imported using importGPX. 

\code{data = 'baleares-places'} imports a SpatVector with twelve points.
}
\description{
Access various datasets used in vignettes and studies associated with the broader \code{lbmech} project
}
\details{
\code{data = 'baleares-currents'} imports ocean current data around Mallorca, Menorca, and Cabrera on June 13, 2022. Data originally downloaded from 
\href{https://data.marine.copernicus.eu/}{E.U. Copernicus Marine Service Information}. See Clementi et al. (2021). 
An internet connection is \strong{not} needed, and parameters \code{name} and \code{dir} are ignored.

\code{data = 'baleares-gps'} downloads GPS tracks for human hikes in the Balearic Islands
in GPX format from \url{https://osf.io/77n9t/}. See Lera et al. (2017).
The \code{name} parameter will define the folder name in the \code{dir} directory to which the \code{.gpx} files are saved. Default \code{name = 'gpx'}.
\code{getData} will \strong{not} import these tracks, for that, use \code{\link[lbmech]{importGPX}}.  An internet connection is needed.
 
\code{data = 'baleares-places'} imports a SpatVector with twelve locations on Mallorca, Menorca, and Cabrera in the Balearic Islands.
}
\examples{
# Import ocean current data for the Balearic Islands

currents <- getData('baleares-currents')
}
\references{
Clementi, E., Aydogdu A., Goglio, A. C., Pistoia J., Escudier R., Drudi M., Grandi A., et al. (2021). 
Mediterranean Sea Physics Analysis and Forecast (CMEMS MED-Currents, EAS6 System). 
\emph{Copernicus Marine Service}. \doi{10.25423/CMCC/MEDSEA_ANALYSISFORECAST_PHY_006_013_EAS7}.

Lera I., Perez T., Guerrero C., Eguiluz V. M., Juiz C. (2017). 
Analysing human mobility patterns of hiking activities through complex network theory. 
\emph{PLoS ONE} 12(5): e0177712. \doi{10.1371/journal.pone.0177712}
}
