#' Run Blast Database Command
#'
#' Pulls protein sequence from database for given row
#'
#' @param query_row Row of interest
#' @param db Path to Fasta refrence file
#' @param ncbi_bin Path to ncbi-blast-2.14.0+/bin
#'
#' @export
run_blastdbcmd <- function(query_row, db, ncbi_bin) {

  # Extract arguments
  accession <- query_row$accession

  seq_range <- query_row$range


  blastdbcmd <- file.path(ncbi_bin, 'blastdbcmd')

  # run blastdbcmd, suppress status warning and use them outside of function
  # if the function returns a status other than 0 (successful), the value
  # with have an attribute 'status' .. attr(result, 'status')
  suppressWarnings(
    system2(blastdbcmd,
            args = c("-db", db,
                     "-dbtype", "prot",
                     "-entry", accession,
                     "-range", seq_range,
                     "-outfmt", '%s'),
            stdout = TRUE, stderr = FALSE)
  )
}
