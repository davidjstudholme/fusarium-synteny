# fusarium_synteny

## Download the CDS and GFF files from NCBI and NGDC:
Note that we can only use genome assemblies for which CDS have been provided. This eliminates most of the chromosome-scale assemblies in NCBI

```
### UK0001 TR4
wget --no-clobber https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/007/994/515/GCA_007994515.1_ASM799451v1/GCA_007994515.1_ASM799451v1_cds_from_genomic.fna.gz
wget --no-clobber https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/007/994/515/GCA_007994515.1_ASM799451v1/GCA_007994515.1_ASM799451v1_genomic.gff.gz

### RIKEN 160527 
wget --no-clobber https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/005/930/515/GCA_005930515.1_ASM593051v1/GCA_005930515.1_ASM593051v1_cds_from_genomic.fna.gz
wget --no-clobber https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/005/930/515/GCA_005930515.1_ASM593051v1/GCA_005930515.1_ASM593051v1_genomic.gff.gz

### FocTR4 58
wget --no-clobber https://download.cncb.ac.cn/gwh/Fungi/Fusarium_oxysporum_f._cubense_Foc4_58_GWHAASU00000000/GWHAASU00000000.CDS.fasta.gz
wget --no-clobber https://download.cncb.ac.cn/gwh/Fungi/Fusarium_oxysporum_f._cubense_Foc4_58_GWHAASU00000000/GWHAASU00000000.gff.gz

### Foc1 60
wget --no-clobber https://download.cncb.ac.cn/gwh/Fungi/Fusarium_oxysporum_f._cubense_Foc1_60_GWHAAST00000000/GWHAAST00000000.CDS.fasta.gz
wget --no-clobber https://download.cncb.ac.cn/gwh/Fungi/Fusarium_oxysporum_f._cubense_Foc1_60_GWHAAST00000000/GWHAAST00000000.gff.gz

gunzip *.fasta.gz *.gff.gz
```
## Generate BED files

```
python -m jcvi.formats.gff bed --type=mRNA --key=locus_tag GCA_007994515.1_ASM799451v1_genomic.gff -o UK0001.bed
python -m jcvi.formats.gff bed --type=mRNA --key=locus_tag GCA_005930515.1_ASM593051v1_genomic.gff -o RIKEN_160527.bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name GWHAASU00000000.gff -o FocTR4_58.bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name GWHAAST00000000.gff -o Foc1_60.bed
```

### Generate properly formatted CDS FastA files
```
perl reformat_fasta_with_locus_tags.pl GCA_007994515.1_ASM799451v1_cds_from_genomic.fna > UK0001.cds
perl reformat_fasta_with_locus_tags.pl GCA_005930515.1_ASM593051v1_cds_from_genomic.fna > RIKEN_160527.cds
perl reformat_fasta_with_locus_tags.pl GWHAASU00000000.CDS.fasta > FocTR4_58.cds
perl reformat_fasta_with_locus_tags.pl GWHAAST00000000.CDS.fasta > Foc1_60.cds
```

### Compare UK0001 against FocTR4_58
```

```
