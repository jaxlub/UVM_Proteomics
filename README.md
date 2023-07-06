# UVM_Proteomics
7/6/23

### Suite Contents
> run_motif_extraction.R \
> build_blastdb.R \
> formatter.R \
> data_pull_and_fill.R \
> run_blastdbcmd.R 
___
This package is built for the Proteomics core of the VBRN located at the University of Vermont. Currently this package functions to pull the 7 residues before and after given protein accessions and phosphosites of interest from core data input using an NCBI Blast database. Moving forward, other functionalities are in the pipeline to further assist the proteomics department as needed. 
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
