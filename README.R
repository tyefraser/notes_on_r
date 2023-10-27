#' This file contains details on how to write notes to the .R files and 
#' summarise these

#' Headings
#' In the file you can use two types of headings, these will be lines that 
#' begin with "# ", or "## ". For example:
# Heading 1
## Heading 1 - subheading 1
## Heading 1 - subheading 2
# Heading 2
## Heading 2 - subheading 1
## Heading 2 - subheading 2

#' For any headings you do not want to include in the summaries, include 
#' something else within the heading, for example a and extra space or a "."
# # Heading 1
## Heading 1 - subheading 1
## Heading 1 - subheading 2
#. # Heading 1
##. Heading 1 - subheading 1
##. Heading 1 - subheading 2


#' Summary sections
#' The Summary sections will be the parts that are added to a summary file. 
#' These sections should contain concise notes that you can refer to in the 
#' future as a refresher. The summary sections will begin with "### Summary" 
#' and end when a new header begins (headings noted above)
### Summary
#' Information or code
mtcars
#' here and finishes as the next heading
# Finished

#' Notes
#' 
#' Any other notes should be added using the "#'" comments. Any sections like 
#' this will only be included in the summary is they are part of the summary 
#' section.
#' 
#' You can force a line to be included in the summary by adding "#." to the end


#' File naming
#' Please name all files you want to summaries with a number at the beginning.
#' E.g. 1_Basics.R, 01_Basics.R, 101_Basics.R, 1A01_Basics.R

#' Generate Summaries
#' To generate the summarise you will need to load the function required and run
#' with the input and output files as arguments. This process has been automated
#' below.

# Set the file location
folder <- dirname(rstudioapi::getSourceEditorContext()$path)

# Get files to summarise
files_to_summarise <- list.files(
  dirname(rstudioapi::getSourceEditorContext()$path),
  pattern = "^[0-9].*\\.R$",
  full.names = TRUE
)
files_to_summarise <- file_to_summarise[!grepl("_summary\\.R$", file_to_summarise)]

# Load function
source(file.path(folder, "functions.R"))

# Run function
for(file in files_to_summarise) {
  extract_summary_sections_and_save(
    input_script = file,
    output_script = sub("\\.R$", "_summary.R", file)
  )
}




