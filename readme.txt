Variant calling pipeline:
  1) gatk_pipeline.txt
     Commands for the gatk variant calling pipeline

Allele frequency calculation & functional annotation on a single-node server:
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

Population structure analysis (integrating thousands of VCFs with 1000 Genomes data) by Admixture on SGI clusters (PBS Pro queue):
  1) overlap.pl
     Find overlapped SNPs between the analyzed cohort and 1000 Genomes data
  2) paral_overlap.pl
     Parallize the previous program using PBS pro queuing system
  3) select_cm.pl
     Select only common SNPs (MAF>0.05)
  4) paral_select.pl
     Parallize the previous program using PBS pro queuing system
  5) select_ind.pl
     Select independent SNPs (2kb apart)
  6) paral_select_ind.pl
     Parallize the previous program using PBS pro queuing system
  7) comb_gt.pl
     Combine the genotypes of the analyzed cohort and 1000 Genomes data
  8) paral_comb_gt.pl
     Parallize the previous program using PBS pro queuing system
  9) convert_2_plink_simple.pl
     Convert VCF files to PLINK files
  10) paral_plink.pl
      Parallize the previous program using PBS pro queuing system
  11) cmb_chr_plink.pl
      Combine the PLINK files of different chromosomes
  12) make_bed.sub
      Convert PLINK files to .bed files
  13) paral_admixture.pl
      Run Admixture under different parameters
  14) combine.pl
      Merge sample IDs with ancestral proportions
