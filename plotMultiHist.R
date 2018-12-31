# create some fake data
dataset1<-rnorm(4000, 100 ,30)
dataset2<-rnorm(4000, 200 ,30)
dataset3<-rnorm(4000, 50,30)

# function to plot several histograms on top of each other
plotMultiHist <- function(myLabels, myColours, ...,  myTitle="Title goes here", xLabel="X axis label"){
  # get distributions to be plotted
  args <- list(...)
  
  # plot each distribution
  for(i in 1:length(args)){
    # if first, use as base
    if(i==1){
      hist(
        args[[i]], 
        breaks=30, 
        xlim=c(0,300), 
        col=myColours[i], 
        xlab=xLabel, 
        ylab="Count",
        main=myTitle
      )
    }
    # if additional, add
    else{
      hist(
        args[[i]], 
        breaks=30, 
        xlim=c(0,300), 
        col=myColours[i], 
        add=T
      )
    }
  }
  
  # add the legend
  legend(
    "topright",
    legend=myLabels, 
    col=myColours, 
    pt.cex=2,
    pch=15
  )
}

# example usage
plotMultiHist(
  myLabels = c("dataset 1", "dataset 2", "dataset 3"),
  myColours = c(rgb(0,0,1,0.5), rgb(1,0,0,0.5), rgb(0,1,0,0.5)),
  dataset1, dataset2, dataset3
)

# example with optional title adding
plotMultiHist(
  myLabels = c("dataset 1", "dataset 2", "dataset 3"),
  myColours = c(rgb(0,0,1,0.5), rgb(1,0,0,0.5), rgb(0,1,0,0.5)),
  myTitle = "3 histograms!",
  dataset1, dataset2, dataset3
)
