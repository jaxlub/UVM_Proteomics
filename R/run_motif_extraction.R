#' Motif Extraction
#'
#' Reformat data file, build Blast Database, pull sequences and add output.
#'
#' @param input_path Path to input file
#' @param output_path Path to output file
#' @param ncbi_bin Path to ncbi-blast-2.14.0+/bin
#' @param protein_ref Path to Fasta refrence file
#' @param num Number of amino acids to extract on either side of the modified amino acid (default = 7)
#'
#' @return Input file with addition of protein sequences
#'
#' @export
run_motif_extraction <- function(input_path, output_path, ncbi_bin, protein_ref, num=7){
  build_blastdb(protein_ref, ncbi_bin)
  formatted <- file_reformater(input_path, num)
  extracted_sequence <- data_pull_and_fill(formatted, protein_ref, ncbi_bin, num)
  return(extracted_sequence)
  write_excel(extracted_sequence, output_path)
}
