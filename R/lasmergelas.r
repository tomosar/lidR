# ===============================================================================
#
# PROGRAMMERS:
#
# jean-romain.roussel.1@ulaval.ca  -  https://github.com/Jean-Romain/lidR
#
# COPYRIGHT:
#
# Copyright 2018 Jean-Romain Roussel
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

#' Merge LAS objects
#'
#' Merge LAS objects
#'
#' @param ... LAS objects
#' @export
rbind.LAS <- function(...)
{
  dots = list(...)
  names(dots) <- NULL
  assert_all_are_same_crs(dots)

  data = data.table::rbindlist(lapply(dots, function(x) { x@data } ))
  return(LAS(data, dots[[1]]@header, dots[[1]]@proj4string))
}

