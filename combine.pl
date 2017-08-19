open(input,"1kg_pid");
%h1=();
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line);
$h1{$a[0]}=$a[1];
}
}
open(input,"1kg_sid");
%h2=();
%k=();
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line);
$h2{$a[0]}=$h1{$a[1]};
$k{$h1{$a[1]}}=0;
}
}
open(input,"all.chr.nosex");
@line1=<input>;
open(input,"all.chr.5.Q");
@line2=<input>;
for($i=0;$i<=$#line1;$i++)
{
@a=split(" ",$line1[$i]);
chomp($line2[$i]);
$line2[$i]=~s/\s+/\t/g;
if($a[0]=~/^M\-101/)
{
print $a[0],"\tmo\t",$line2[$i],"\n";
}
else
{
print $a[0],"\t",$h2{$a[0]},"\t",$line2[$i],"\n";
}
}
