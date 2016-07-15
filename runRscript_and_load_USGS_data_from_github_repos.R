#  Run R scripts from github repositories
#  From https://github.com/opetchey/RREEBES/wiki/Reading-data-and-code-from-an-online-github-repository

#  This script calls an R script that loads data from a github repository (USGS streamflow data) and plots it

library(RCurl)

url.load.run.from.github = "https://raw.githubusercontent.com/tbiggsgithub/Run_Rcode_from_Github/master/load_wilson_USGS_from_github_clean.R"
script.load.run.from.github = getURL(url.load.run.from.github)
eval(parse(text=script.load.run.from.github))



