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
$b=`ls chr/$x.*.gz`;
$b=~s/\n/ /g;
$cmd="/root/software/vcftools_0.1.13/bin/vcf-merge -d -t $b \| bgzip -c \> merged/$x.vcf.gz";
system("$cmd");
#print $cmd,"\n";
}
