#' Format File Input
#'
#' Parse and reformat input file to have only 1 row corresponding to 1 accession.
#'
#' @param input_path Path to input file
#' @param num Number of amino acids to extract on either side of the modified amino acid (default = 7)
#'
#' @return Reformatted Input File
#'
#' @export
file_reformater <- function (input_path, num=7){
  table <- read_excel(input_path)
  expand <- table %>% filter(!is.na('Modifications in Master Proteins')) %>% separate_rows('Modifications in Master Proteins', sep="\\];")
  expand <- expand %>% mutate(accession = str_replace_all(expand$'Modifications in Master Proteins', "(.*) .xPhospho \\[.(.*)\\(.*", "\\1"))
  expand <- expand %>% mutate(midpoint = str_replace_all(expand$'Modifications in Master Proteins', "(.*) .xPhospho \\[.(.*)\\(.*", "\\2"))
  expand <- replace(expand, expand=='', NA)
  expand <- expand %>% tidyr::fill(accession)

  expand <- expand %>% separate_rows(midpoint, sep=";")

  expand <- expand %>% mutate(midpoint = str_replace_all(expand$midpoint, " .(.*)", "\\1"))

  expand <- expand %>% mutate(midpoint = str_replace_all(expand$midpoint, "(.*)\\(.*\\)", "\\1"))

  # negative numbers are a problem
  expand <- suppressWarnings(expand %>% mutate(start = (as.numeric(midpoint) - num)))

  expand <- expand %>% mutate(start = case_when(start < 0 ~ 1, TRUE ~ start))

  expand <- suppressWarnings(expand %>% mutate(end = (as.numeric(midpoint) + num)))

  expand <- expand %>% mutate(range = paste0(start, "-", end))

  return(expand)
}
