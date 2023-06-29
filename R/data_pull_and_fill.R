#' Fills in Sequences of input file
#'
#' Loops through reformatted input file and pulls 15 character ranges from blast.
#'
#' @param
#'
#' @return Final Data Sheet w/ Extracted Sequences
#'
#' @export
data_pull_and_fill <- function() {
  # make new column in table "extracted_sequence"
  expand <- expand %>% mutate(extracted_sequence = "")

  for (row in rownames(expand)){

    sequence <- run_blastdbcmd(query_row = expand[row, ], db = ref_protein, ncbi_bin = ncbi_bin)
    expand <- expand %>% mutate(extracted_sequence = ifelse(row_number() == row, sequence, extracted_sequence))

  }
}

