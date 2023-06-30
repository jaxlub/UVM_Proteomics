#path to the protein sequence for the reference database
ref_protein <- "/Users/eguswa/Documents/Open_UVM_Projects/Proteomics_core/Mouse_ref/protein.faa"

#path to bin in blast suit
ncbi_bin <- "/Applications/ncbi-blast-2.14.0+/bin"

#input data sheet
input_path <- "/Users/eguswa/Documents/Open_UVM_Projects/Proteomics_core/Peptide_extraction/May222023_Eclipse_2022_138_unnormalized_peptideIsoforms_Bioinformatics.xlsx"

#output path
out_dir_path <- "/Users/eguswa/Documents/Open_UVM_Projects/Proteomics_core/Peptide_extraction"

outfile_name <- "May222023_Eclipse_2022_138_with_extracted_sequence"

build_blastdb(ref_protein)
file_reformater(input_path)
data_pull_and_fill()
