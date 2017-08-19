for($i=1;$i<=25;$i++)
{
$x=$i;
if($i==23)
{
$x="X";
}
if($i==24)
{
$x="Y";
}
if($i==25)
{
$x="M";
}
print $x,"\n";
$cmd="/root/software/vcftools_0.1.13/bin/vcftools --gzvcf $x.vcf.gz --freq --out freq/$x";
system("$cmd");
#print $cmd,"\n";
}
