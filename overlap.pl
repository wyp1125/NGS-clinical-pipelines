if($#ARGV<3)
{
print "1kg_chr 101_chr calls_cut output\n";
exit;
}
open(input,"$ARGV[0]");
%h1=();
#%h2=();
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line);
$h1{$a[1]}=$a[2];
#$h2{$a[1]}=$a[4];
}
}
open(input,"$ARGV[1]");
open(output,">$ARGV[3]");
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=();
@a=split("\t",$line);
if(exists $h1{$a[1]} && $#a==3)
{
$x=0;
for($i=2;$i<=3;$i++)
{
@b=split("\:",$a[$i]);
$al_1[$i-2]=$b[0];
$af_1[$i-2]=$b[1];
$x+=$b[1];
}
if($x>=$ARGV[2])
{
$ref_1=$al_1[0];
$alt_1=$al_1[1];
$maf_1=$af_1[0];
if($af_1[0]>$af_1[1])
{
$ref_1=$al_1[1];
$alt_1=$al_1[0];
$maf_1=$af_1[1];
}
$maf_1=$maf_1/$x;
@c=split("\,",$h1{$a[1]});
for($i=0;$i<=1;$i++)
{
@b=split("\:",$c[$i]);
$al_2[$i]=$b[0];
$af_2[$i]=$b[1];
}
$ref_2=$al_2[0];
$alt_2=$al_2[1];
$maf_2=$af_2[0];
if($af_2[0]>$af_2[1])
{
$ref_2=$al_2[1];
$alt_2=$al_2[0];
$maf_2=$af_2[1];
}
if($ref_1 eq $ref_2 && $alt_1 eq $alt_2)
{
print output "$a[0]\t$a[1]\t$ref_1\t$alt_1\t$maf_1\t$maf_2\n";
}
}
}
#print output $line,"\t",$h1{$a[1]},"\t",$h2{$a[1]},"\n";
}
}

