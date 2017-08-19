open(output1,">all.chr.ped");
open(output2,">all.chr.map");
$n=0;
open(input,"plink/chr1.ped");
while($line=<input>)
{
chomp($line);
$oline[$n][0]=$line;
$n++;
}
for($i=2;$i<=22;$i++)
{
$n=0;
open(input,"plink/chr$i.ped");
while($line=<input>)
{
chomp($line);
@a=split("\t",$line,7);
$oline[$n][$i-1]=$a[6];
$n++;
}
}
for($j=0;$j<$n;$j++)
{
print output1 $oline[$j][0];
for($i=1;$i<22;$i++)
{
print output1 "\t",$oline[$j][$i];
}
print output1 "\n";
}
for($i=1;$i<=22;$i++)
{
open(input,"plink/chr$i.map");
while($line=<input>)
{
print output2 $line;
}
}
