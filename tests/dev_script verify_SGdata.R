#'
#'
#' Just some idea to write during output:
#' ✓, ✓, ✓, X, ✓,
#'
#'
#'
#'
#'



library(Luminescence)
source("D:/Data/R/Luminescence/R/verify_SingleGrainData.R")

##01 - basic example I
##just show how to apply the function
data(ExampleData.XSYG, envir = environment())

##verify and get data.frame out of it
verify_SingleGrainData(OSL.SARMeasurement$Sequence.Object)$selection_full

##02 - basic example II
data(ExampleData.BINfileData, envir = environment())
id <- verify_SingleGrainData(object = CWOSL.SAR.Data,
cleanup_level = "aliquot")$selection_id


#' ##03 - advanced example I
##importing and exporting a BIN-file

##select and import file
#file <- file.choose()
file <- "D:\\Data\\OSL decomposition\\application\\SUV3_SG\\SUV3_SG_disc1-4.BIN"
object <- read_BIN2R(file)

##remove invalid aliquots(!)
object <- verify_SingleGrainData(object, cleanup = TRUE)

##export to new BIN-file
write_R2BIN(object, paste0(dirname(file),"/", basename(file), "_CLEANED.BIN"))