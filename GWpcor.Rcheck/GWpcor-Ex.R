pkgname <- "GWpcor"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "GWpcor-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('GWpcor')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("gwpcor")
### * gwpcor

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: gwpcor
### Title: Geographically Weighted Correlation and Partial Correlation
### Aliases: gwpcor
### Keywords: "SPATIAL" "MULTIVALIATE"

### ** Examples

#NOTE: This example only shows how to implement gwpcor using sample data (meuse) in sp package. 
#Results do not suggest any meanings.

#import data from sp package
library(sp)
library(sf)
data(meuse, package = "sp") 
meuse_sf <- st_as_sf(meuse, coords = c("x", "y"), crs = 28992)

#implement gwpcor as an example
#the bandwidth is arbitrary.
res <- gwpcor(sdata = meuse_sf, vars = c("cadmium","copper", "zinc"),
method = "pearson", kernel = "bisquare",adaptive = TRUE, 
bw = 0.25, geodisic_measure = "cheap", foreach = FALSE)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("gwpcor", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
