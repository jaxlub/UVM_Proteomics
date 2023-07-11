#' Build Blast Database
#'
#' Generated blast database from NCBI
#'
#' @param ref_protein Path to Fasta refrence file
#' @param ncbi_bin Path to ncbi-blast-2.14.0+/bin
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
