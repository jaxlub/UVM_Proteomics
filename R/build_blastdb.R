#' Build Blast Database
#'
#' Generated blast database from NCBI
#'
#' @param x Protein Sequence for the Reference Database
#' @param ref_protein Path to Fasta refrence file
#'
#' @export
build_blastdb <- function(ref_protein, ncbi_bin){
  makeblastdb <- file.path(ncbi_bin, 'makeblastdb')

   system2(makeblastdb,
          args = c("-in", ref_protein,
                   "-input_type", "fasta",
                   "-dbtype", "prot",
                   "-parse_seqids"),
          stdout = TRUE, stderr = FALSE)

}
