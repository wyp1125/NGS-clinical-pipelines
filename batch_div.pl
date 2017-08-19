$b=`ls norm3/*.vcf`;
@a=split("\n",$b);
for($i=0;$i<=$#a;$i++)
{
print $i,"\n";
$cmd="perl divide_vcf_by_chr.pl $a[$i] chr";
#print $cmd,"\n";
system("$cmd");
}
