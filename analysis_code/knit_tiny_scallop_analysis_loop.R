# Small R script to render lots of variations of the scallop_analysis_tiny_report.Rmd. This allows us to pass in different shapefiles or do different aggregations.  
# Borrowed heavily from https://bookdown.org/yihui/rmarkdown/params-knit.html

library("here")
library("rmarkdown")

here::i_am("analysis_code/knit_tiny_scallop_analysis_loop.R")

#create a directory in main for the casestudy data to go
dir.create(here::here("data","main","casestudies"), showWarnings="FALSE")

# Define the "things" you want to loop over.
AADAS_Vals_to_loop<-c(TRUE,FALSE) # TRUE is the AADAS fleet. FALSE is the IFQ fleet
subtrip_aggregate_vals_to_loop<-c(TRUE) # TRUE aggregates subtrips to trips. FALSE does not

# We want to be able to run the tiny "area" level analysis on all the shapefiles. I don't know if we can.
#input_shapefile_vals_to_loop2<-c("wind_Central_Atlantic_1.RDS", "wind_Central_Atlantic_2.RDS","wind_Central_Atlantic_3.RDS", "wind_sf_nocable.RDS", "wind_sf_combined.RDS")
input_shapefile_vals_to_loop2<-c("wind_NY1.RDS","wind_NY2.RDS","wind_NY3.RDS","wind_Central_Atlantic_1.RDS", "wind_Central_Atlantic_2.RDS","wind_Central_Atlantic_3.RDS")



##################################################################################
# The combine_cable_routes.Rmd must be rendered to process the cable route and finagle the shapefiles into a format required by FishSET
rmarkdown::render(here::here("data_wrangle","combine_cable_routes.Rmd"),
                  output_file = here::here("data_wrangle","combine_cable_routes.html"))
##################################################################################



##################################################################################
#Define a function that passes parameters into the rmarkdown::render function
render_tiny_report = function(AA_DAS_only, subtrip_aggregate, input_shapefile) {
  rmarkdown::render(here::here("analysis_code","scallop_analysis_tiny_report.Rmd"), params = list(
    AA_DAS_only = AA_DAS_only,
    subtrip_aggregate = subtrip_aggregate,
    input_shapefile=input_shapefile
  ),
  output_file = here::here("results",paste0("scallop_tiny_AA_",AA_DAS_only,"_subtripaggregate_",subtrip_aggregate,"_shapefile_", gsub(".RDS", "",input_shapefile ), ".html")
  ))
}
################################################################################## 


# Run lots of tiny scallop analysis reports.
for (AA_DAS_only_val in AADAS_Vals_to_loop ) {
  for (subtrip_aggregate_val in subtrip_aggregate_vals_to_loop ) {
    for (input_shapefile_val in input_shapefile_vals_to_loop2)  {
      render_tiny_report(AA_DAS_only_val,subtrip_aggregate_val, input_shapefile_val)
    }
  }
}





  
