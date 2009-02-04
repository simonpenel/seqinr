\name{peakabif}
\alias{peakabif}
\title{Peak location extraction for ABIF data}
\description{
  Simple peak location for data imported with the \code{\link{read.abif}} function
  using cubic spline interpolation.
}
\usage{
peakabif(abifdata, 
  chanel, 
  npeak, 
  thres = 400/yscale, 
  fig = TRUE,
  chanel.names = c(1:4,105),
  DATA = paste("DATA", chanel.names[chanel], sep = "."),
  tmin = 1/tscale,
  tmax = abifdata$Data[["SCAN.1"]]/tscale,
  tscale = 1000, 
  yscale = 1000,
  irange = (tmin*tscale):(tmax*tscale),
  y = abifdata$Data[[DATA]][irange]/yscale,
  method = "monoH.FC",
  ...)
}
\arguments{
  \item{abifdata}{the result returned by \code{\link{read.abif}}}
  \item{chanel}{the dye number}
  \item{npeak}{the expected number of peaks}
  \item{thres}{scaled threshold value}
  \item{fig}{logical: should localized peaks be plotted}
  \item{chanel.names}{numbers extensions used for the DATA}
  \item{DATA}{names of the DATA components}
  \item{tmin}{scaled starting time for the time axis}
  \item{tmax}{scaled ending time for the time axis}
  \item{tscale}{scale factor for the time axis}
  \item{yscale}{scale factor for the y-axis (RFU)}
  \item{irange}{indices of data to be plotted}
  \item{y}{values used for the y-axis}
  \item{method}{method to be used by \code{\link{splinefun}}}
  \item{...}{arguments forwarded to \code{\link{plot}}}
}
\value{
  Returns invisibly the unscaled values for the location of peaks.
}
\references{
  \code{citation("seqinr")}
}
\author{J.R. Lobry}
\seealso{
  function \code{\link{read.abif}} to import files in ABIF format, 
  \code{\link{plotabif}} to plot them,
  data \code{\link{gs500liz}} for internal size standards,
  data \code{\link{identifiler}} for allele names in the allelic ladder,
  data \code{\link{JLO}} for an example of an individual sample file,
  data \code{\link{ECH}} for an example of an allelic lader.
}
\examples{
data(JLO)
JLO.maxis <- peakabif(JLO, 5, npeak = 14, tmin = 2.7, thres = 0.1)
}
