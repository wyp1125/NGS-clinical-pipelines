1) batch_left_normalize.pl
Use VT tools to left normalize each VCF file
2) divide_vcf_by_chr.pl 
Divide a VCF file into chromosomal VCF files
3) batch_div.pl
Run the previous program for each VCF file
4) batch_merge_vcf.pl
Merge the chromosomal VCF files of different samples into a single VCF file for each chromosome using VCFtools
5) batch_freq.pl
Compute allele frequencies for each VCF file
6) merge_vcf_frq.pl
Merge the VCFtools-generated frequency file to its original VCF file 
7) batch_merge_vcf.pl
Run the previous program for each VCF file
8) batch_annovar.pl
Annotate each VCF file using AnnoVar
