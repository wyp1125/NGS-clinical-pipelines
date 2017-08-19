$b=`ls *.vcf`;
@a=split("\n",$b);
for($i=0;$i<=$#a;$i++)
{
#print $a[$i],"\n";
$ofl=$a[$i];
$ofl=~s/\.vcf//;
$cmd="perl /root/software/annovar/table_annovar.pl --vcfinput $a[$i] /root/software/annovar/humandb/ -buildver hg19 -out out2/$ofl --thread 20 -remove -protocol";
$cmd=$cmd." refGene,cytoBand,phastConsElements46way,tfbsConsSites,gwasCatalog,snp135,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eas,1000g2015aug_eur,1000g2015aug_sas,exac03,clinvar_20161128 -operation g,r,r,r,r,f,f,f,f,f,f,f,f,f -nastring .";
system("$cmd");
}
