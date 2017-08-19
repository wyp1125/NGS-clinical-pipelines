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
$cmd="perl merge_vcf_frq.pl ../merged1/$x.vcf freq/$x.frq combfrq/$x.frq_vcf";
system("$cmd");
#print $cmd,"\n";
}
