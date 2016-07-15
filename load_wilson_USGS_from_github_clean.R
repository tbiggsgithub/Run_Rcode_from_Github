library(Rcurl)

myurl = "https://raw.githubusercontent.com/tbiggsgithub/Run_Rcode_from_Github/master/data/11010900_wilson_creek_trib_daily.txt"

#  WORKS!!!
GageData <-readLines(url(myurl))
GDNarrow_USGS = (GageData[grep("USGS", GageData)])  # SELECT ONLY LINES WITH "USGS" IN THEM
GDNarrow_dataonly = GDNarrow_USGS[grep("#", GDNarrow_USGS, invert=TRUE)]  # UNSELECT COMMENT LINES
out = strsplit(GDNarrow_dataonly,"\\t")  # Change the "/t" to "," if using comma delimited file
g = do.call(rbind,out)
dt = strptime(g[,3],format="%Y-%m-%d")
q = as.numeric(g[,4])
plot(dt,q,type="l") 
