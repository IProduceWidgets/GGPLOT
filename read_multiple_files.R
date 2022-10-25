oldwd <- getwd() # just saves where youre current working directory is so we can go back to it later.

setwd("C:/MyFolderPath") # tells all the following functions to default their file path to your data folder



filelist <- list.files(
  # path =  # set by setwd(...)
  pattern = "ConsistentFileNameScheme*.txt"   # See: help(list.files) > Pattern
  # recursive = T  # tells the list.files function to look in sub folders too.
)

BigListOfDataFrames <- lapply(filelist,
                               FUN=read.delim, # this can be another file reading function such as read_xlsx
                               header = T # flags for the read.delim (or other) function, you can add multiple.
                               )
BigAppendedDF <- do.call("rbind", BigListOfDataFrames) # appends all the loaded datafiles to the end of eachother.

setwd(oldwd) # resets our working directory.