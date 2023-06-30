#' Motif Extraction
#'
#' Reformat data file, build Blast Database, pull sequences and add output.
#'
#' @param input_path Path to input file
#' @param ncbi_bin Path to ncbi-blast-2.14.0+/bin
#' @param protein_ref Path to Fasta refrence file
#'
#' @return Input file with addition of protein sequences
#'
#' @export
run_motif_extraction <- function(input_path, ncbi_bin, protein_ref){
  build_blastdb(protein_ref, ncbi_bin)
  formatted <- file_reformater(input_path)
  input100 <- formatted[1:100, ]
  extracted_sequence <- data_pull_and_fill(formatted, protein_ref, ncbi_bin)
  return(extracted_sequence)
}




