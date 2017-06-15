# indir = "Complete pathway of working directory goes here"

#indir = "G:/mydocuments/SDSU/research/CA/san_diego/hydromodification/HSPF/discharge_analysis/DischargeData/"
#setwd(indir)

#Gage ID Goes Here
# fname = ".csv or txt file name goes here"
#fname = "11010900_wilson_creek_trib_daily.txt"

#setwd(indir)
#GageData = readLines(fname) 
myurl = "https://raw.githubusercontent.com/tbiggsgithub/Run_Rcode_from_Github/master/data/11010900_wilson_creek_trib_daily.txt"

# Doesn't work:
# GageData <-readLines(getURL(myurl))

#  WORKS!!!
GageData <-readLines(url(myurl))

# Doesn't work:
#fname = tempfile()
#download.file(myurl,fname,method="wget")
#source(fname)
#unlink(fname)

# Doesn't work:
#x = source(pipe(paste("wget -O -", myurl)))

#  Doesn't work:
#GageData <-getURL("https://raw.githubusercontent.com/tbiggsgithub/Run_Rcode_from_Github/master/data/11010900_wilson_creek_trib_daily.txt")

# Doesn't work:
#github.download = function(url) {
#  fname <- tempfile()
#  system(sprintf("curl -3 %s > %s", url, fname))                                                                                                                                                                                                                                                                                                                          
#  return(fname)
#}
#x = source(github.download(myurl))

GDNarrow_USGS = (GageData[grep("USGS", GageData)])  # SELECT ONLY LINES WITH "USGS" IN THEM
GDNarrow_dataonly = GDNarrow_USGS[grep("#", GDNarrow_USGS, invert=TRUE)]  # UNSELECT COMMENT LINES
out = strsplit(GDNarrow_dataonly,"\\t")  # Change the "/t" to "," if using comma delimited file
g = do.call(rbind,out)
dt = strptime(g[,3],format="%Y-%m-%d")
q = as.numeric(g[,4])
plot(dt,q,type="l") 
