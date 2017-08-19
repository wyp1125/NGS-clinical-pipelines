if($#ARGV<1)
{
print "input_prefix output\n";
exit;
}
open(output1,">$ARGV[1].map");
open(output2,">$ARGV[1].ped");
open(input,"$ARGV[0]");
$line=<input>;
chomp($line);
@s=split("\t",$line);
for($i=2;$i<=$#s;$i++)
{
$gt[$i-2][0]=$s[$i];
$gt[$i-2][1]=$s[$i];
$gt[$i-2][2]=0;
$gt[$i-2][3]=0;
$gt[$i-2][4]=0;
$gt[$i-2][5]=0;
}
$m=0;
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line);
$chr=$a[0];
$chr=~s/chr//;
print output1 $chr,"\t",$chr."a".$m,"\t0\t",$a[1],"\n";
for($i=2;$i<=$#a;$i++)
{
@b=split("\\/",$a[$i]);
$gt[$i-2][2*$m+6]=$b[0];
$gt[$i-2][2*$m+7]=$b[1];
}
$m++;
}
}
for($j=0;$j<$#s-1;$j++)
{
print output2 $gt[$j][0];
for($i=1;$i<2*$m+6;$i++)
{
print output2 "\t",$gt[$j][$i];
}
print output2 "\n";
}
