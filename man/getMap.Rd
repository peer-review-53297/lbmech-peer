% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getMap.R
\name{getMap}
\alias{getMap}
\title{Download or crop necessary DEMs}
\usage{
getMap(
  tiles,
  polys,
  tile_id = "TILEID",
  vals = "location",
  z_min = NULL,
  filt = 0,
  verbose = FALSE,
  dir = tempdir()
)
}
\arguments{
\item{tiles}{A character vector--such as the output to
\code{\link[lbmech]{whichTiles}}---containing the unique tile IDs for sectors that
should be in the workspace.}

\item{polys}{A polygon of class SpatVector representing
the partitioning grid for the maximum possible area, in the same format as the
output of the \code{\link[lbmech]{makeGrid}} function.}

\item{tile_id}{a character string representing the name of the column
in the \code{polys} polygon containing the unique Tile IDs. Default is \code{tile_id = 'TILEID'}}

\item{vals}{A character string or a SpatRast or Raster* object. Optional if the
\code{polys} polygon is the output of the \code{\link[lbmech]{makeGrid}} function as the default is
the character string \code{'location'}. If no DEM was provided when \code{\link[lbmech]{makeGrid}} 
was initially run (i.e. polys$location == NA), then the function will 
use \code{\link[elevatr]{get_elev_raster}} to download data. 
If not from \code{\link[lbmech]{makeGrid}}, the \code{vals} parameter should be
set to the column name containing the URL or filepath to the DEM for that
sector.}

\item{z_min}{The minimum allowable elevation. Useful if DEM source includes
ocean bathymetry as does the SRTM data from AWS. Default is \code{z_min = NULL},
but set to \code{0} for SRTM data.}

\item{filt}{Numeric. Size of moving window to apply a low-pass filter.
Default is \code{filt = 0}.}

\item{verbose}{Should the number of remaining sectors be printed? Default
is \code{FALSE}}

\item{dir}{A filepath to the directory being used as the workspace.
Default is \code{tempdir()} but unless the analyses will only be performed a few
times it is highly recommended to define a permanent workspace.}
}
\value{
Function does not return any objects, but sets up the workspace
such that the necessary DEM files are downloaded/cropped and accessible.
}
\description{
A function that checks if the DEMs for a given set of sectors exist
in the workspace, and if not downloads them or crops them from a larger file
}
\examples{
# Generate a DEM, export it
n <- 5
dem <- expand.grid(list(x = 1:(n * 100),
                        y = 1:(n * 100))) / 100
dem <- as.data.table(dem)
dem[, z := 250 * exp(-(x - n/2)^2) + 
      250 * exp(-(y - n/2)^2)]
dem <- rast(dem)
ext(dem) <- c(10000, 20000, 30000, 40000)
crs(dem) <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +datum=WGS84"

dir <- tempdir()
writeRaster(dem, paste0(dir,"/DEM.tif"),overwrite=TRUE)


# Import raster, get the grid
dem <- rast(paste0(dir,"/DEM.tif"))
grid <- makeGrid(dem = dem, nx = n, ny = n, sources = TRUE)


# Generate five random points that fall within the grid
points <- data.table(x = runif(5, ext(dem)[1], ext(dem)[2]),
                     y = runif(5, ext(dem)[3], ext(dem)[4]))
               
                           
# Run whichTiles and getMap to prepare appropriate sector files
tile_list <- whichTiles(region = points, polys = grid) 
getMap(tiles = tile_list, polys = grid, dir = dir)
}
