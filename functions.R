################################################################################
# functions.R ##################################################################
################################################################################
#' This file contains some functions that are used for the R note, for example
#' summarising the notes into a separate file.


#' Function to summarise the R notes
#' 
#' This function reads the lines in the R notes and finds headings (lines that 
#' begin with "# ", or "## ") and any summarise (sections that start with 
#' "### Summary") and end with a new heading, and adds these to a summary file.
#' @param input_script The file to be summarised
#' @param output_script The file to save the summary to
#' 
#' @example extract_summary_sections_and_save(
#'    input_script = file.path(folder, 'test.R'),
#'    output_script = file.path(folder, "lesson_summaries.R")
#'  )
#' 
#' @author Tye Fraser
#' @export
extract_summary_sections_and_save <- function(input_script, output_script) {
  
  # Create empty file to add to 
  if(file.exists(output_script)){ unlink(output_script)}
  file.create(output_script)
  
  # Read input_script lines
  script_text <- readLines(input_script, warn = FALSE)
  
  # Set summary section finder to no (0)
  is_summary <- 0
  
  # go through each line fo the input script
  line <- script_text[59]
  for (line in script_text) {
    
    if (grepl("^####", line) |
        grepl("^#\\.", line) |
        grepl("^##\\.", line) |
        grepl("^###\\.", line)) {
      is_summary <- 0 # Header marks the end of a summary
    } else if (grepl("*#\\.$", line)) {
      # If its a heading add it to the doc
      cat(line, file = output_script, append = TRUE, sep = "\n")
      #cat("", file = output_script, append = TRUE, sep = "\n")
      
      
    } else if (grepl("^# ", line)) {
      # If its a heading add it to the doc
      cat("", file = output_script, append = TRUE, sep = "\n")
      cat(line, file = output_script, append = TRUE, sep = "\n")
      is_summary <- 0 # Header marks the end of a summary
      
    } else if(grepl("^## ", line)) {
      # If its a heading add it to the doc
      cat("", file = output_script, append = TRUE, sep = "\n")
      cat(line, file = output_script, append = TRUE, sep = "\n")
      is_summary <- 0 # Header marks the end of a summary
      
    } else if(is_summary == 1) {
      # continue adding summary
      cat(line, file = output_script, append = TRUE, sep = "\n")
      
    } else if (grepl("^### Summary", line)) {
      # Start of summary
      cat(line, file = output_script, append = TRUE, sep = "\n")
      is_summary <- 1 # Start of summary
      
    } else {
      # Part of lesson test, not added to summarised .R file
    }
    
  }
}

