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

system2(command = "echo", args = '$PATH')


# Get the current PATH variable
current_path <- Sys.getenv("PATH")

# Add a new directory to the PATH
new_directory <- "/Users/jaxlub/Downloads/ncbi-blast-2.14.0+/bin"
updated_path <- paste(new_directory, current_path, sep = ":")

# Set the updated PATH variable in the R session
Sys.setenv(PATH = updated_path)










# Retrieve the PATH variable from the environment
path <- Sys.getenv("PATH")
print(path)
# Split the PATH into individual directories
path_directories <- unlist(strsplit(path, ":"))
print(path_directories)

blast_path <- grep("ncbi-blast-2.14.0+", path_directories, value = TRUE)

