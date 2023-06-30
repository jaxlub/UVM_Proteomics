#' Fills in Sequences of input file
#'
#' Loops through reformatted input file and pulls 15 character ranges from blast.
#'
#' @param input_file Input data file
#' @param ref_protein Path to Fasta refrence file
#' @param ncbi_bin Path to ncbi-blast-2.14.0+/bin
#'
#' @return Final Data Sheet w/ Extracted Sequences
#'
#' @export
data_pull_and_fill <- function(input_file, ref_protein, ncbi_bin) {
  # make new column in table "extracted_sequence"
  expand <- input_file %>% mutate(extracted_sequence = "")

  for (row in rownames(expand)){

    sequence <- run_blastdbcmd(query_row = expand[row, ], db = ref_protein, ncbi_bin)
    expand <- expand %>% mutate(extracted_sequence = ifelse(row_number() == row, sequence, extracted_sequence))
    expand <- expand %>% mutate(extracted_sequence = ifelse(nchar(extracted_sequence) < 15,
                                                            paste0(extracted_sequence, strrep("X", 15 - nchar(extracted_sequence))),
                                                            extracted_sequence))
  }
  return(expand)
}

