# indir = "Complete pathway of working directory goes here"

indir = "G:/mydocuments/SDSU/research/CA/san_diego/hydromodification/HSPF/discharge_analysis/DischargeData/"
setwd(indir)

#Gage ID Goes Here
# fname = ".csv or txt file name goes here"
fname = "11010900_wilson_creek_trib_daily.txt"

setwd(indir)
GageData = readLines(fname) 
GDNarrow_USGS = (GageData[grep("USGS", GageData)])  # SELECT ONLY LINES WITH "USGS" IN THEM
GDNarrow_dataonly = GDNarrow_USGS[grep("#", GDNarrow_USGS, invert=TRUE)]  # UNSELECT COMMENT LINES
out = strsplit(GDNarrow_dataonly,"\\t")  # Change the "/t" to "," if using comma delimited file
g = do.call(rbind,out)
dt = strptime(g[,3],format="%Y-%m-%d")
q = as.numeric(g[,4])
plot(dt,q,type="l") 
