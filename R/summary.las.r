# ===============================================================================
#
# PROGRAMMERS:
#
# jean-romain.roussel.1@ulaval.ca  -  https://github.com/Jean-Romain/lidR
#
# COPYRIGHT:
#
# Copyright 2016 Jean-Romain Roussel
#
# This file is part of lidR R package.
#
# lidR is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#
# ===============================================================================



#' Summary of LAS data
#'
#' This functions implements a \link[base:summary]{summary} method for LAS objects
#'
#' @aliases summary
#' @param object An object of the class \code{LAS}
#' @param \dots Unused (inherited from R base)
#' @examples
#' LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
#'
#' lidar = readLAS(LASfile)
#'
#' summary(lidar)
#'
#' @export
#' @seealso
#' \link[lidR:LAS]{Class LAS}
#' @importFrom utils object.size
summary.LAS =	function(object, ...)
{
  size <- format(object.size(object), units = "auto")

  cat(paste("Memory :", size, "\n", sep=" "))

  cat("\n")

  cat("area :", object@area, "square units\n")
  cat("points :", dim(object@data)[1], "points\n")
  cat("pulses :", dplyr::n_distinct(object@data$pulseID), "pulses\n")
  cat("point density :", object@pointDensity, "points/square units\n")
  cat("pulse density :", object@pulseDensity, "pulses/square units\n")
}
