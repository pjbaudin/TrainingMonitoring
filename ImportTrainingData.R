# Load libraries
library(stringr)
library(purrr)
library(lubridate)
library(dplyr)

# Set up working directory
setwd("D:/Data Science/R_Personal/TrainingMonitoring")

# Import split data
subdirSplit <- "./Sport_data/Splits_data"

Splitlist <- list.files(subdirSplit)

ImportSplitData <- function(Splitlist) {
        FilePath <- paste(subdirSplit, "/", Splitlist, sep = "")
        dfname <- str_sub(Splitlist, start = 1L, end = 8L)
        df <- read.csv(FilePath)
        df$Date <- ymd(dfname)
        assign(dfname, df)
        
}

Importlist <- map(Splitlist, ImportSplitData)

Importlist <- bind_rows(Importlist)