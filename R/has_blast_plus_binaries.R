#' Check BLAST+ installation
#'
#' Checks required BLAST+ binaries are in the PATH, or found with given path. This
#' function returns a TRUE/FALSE for quick logic.
#'
#'
#' @return TRUE/FALSE with attributes ncbi_bin, checked_binaries
#'
#' @export
has_blast_plus_binaries <- function(){
  binaries_to_check <-
    list(blastn = "blastn",
         blastdbcmd = "blastdbcmd")
  checked_binaries <-
    c(
      blastn =
        tryCatch(system2(command = binaries_to_check$blastn, args = '-version', stdout = TRUE),
                 error = function(e) 'Not installed')[1]
      ,
      blastdbcmd =
        tryCatch(system2(command = binaries_to_check$blastdbcmd, args = '-version', stdout = TRUE),
                 error = function(e) 'Not installed')[1]
    )

  all_binaries_installed =  !all(checked_binaries %in% 'Not installed')
  print(paste("BlastDB Installed:", all_binaries_installed))
}