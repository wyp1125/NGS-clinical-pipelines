if($#ARGV<1)
{
print "input outdir\n";
exit;
}
@a=split("\\/",$ARGV[0]);
$fl=$a[$#a];
$chr="";
open(input,"$ARGV[0]");
$head=<input>;
while($line=<input>)
{
if($line=~/\#/)
{
$head=$head.$line;
}
if($line!~/\#/)
{
@a=split("\t",$line,2);
$a[0]=~s/chr//;
if($a[0] ne $chr)
{
$chr=$a[0];
open(output,">$ARGV[1]/$chr.$fl");
print output $head;
}
print output $a[0],"\t",$a[1];
}
}
