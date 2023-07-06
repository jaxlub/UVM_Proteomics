# UVM_Proteomics
7/6/23

### Suite Contents
> run_motif_extraction.R \
> build_blastdb.R \
> formatter.R \
> data_pull_and_fill.R \
> run_blastdbcmd.R 
___
This suite finds the the 7 residues before and after given accessions and phosphosites of interest. The input data file must match the formatting guidelines below. The suite will then reformat all of the lines to one style. Full_formatter.sh reformats each line to match the "normal line format" (see Line Formats #4). Once formatted, the data is then pulled from the NCBI and recorded in the results file. The data from the uniProt database is also pulled. This suite does not modify the original data file but builds a new identical one with the new sequences. In addition to a results file, a formatted.txt file is produced (without the sequences). Ranges.txt captures the start and end phosphosites and their corresponding accession. Formatted.txt contains the initial data file (without sequences) formatted properly. This can be beneficial to ensure proper data is pulled. All other intermediate files are deleted. 
___

### Installation
Package can be installed from github via 
```R
install.packages("devtools")
install_github("UVM_Proteomics",username="jaxlub")
```
Another download option is to download a zip file from github, unzip it and then run 
```R
install.packages("devtools")
source <- devtools:::source_pkg("path/to/package")
install(source)
```
___

### Parameters
This program has 3 parameters.
1. The path to the data file
2. The path to ncbi-blast-2.14.0+/bin
3. The path to Fasta refrence file for desired organism \
Example:
```R
run_motif_extraction(path/to/data, path/to/NCBIblast, path/to/refrence)
```
___
