open(input,"$ARGV[0]");
$n=0;
while($line=<input>)
{
if($line!~/^\#\#/)
{
chomp($line);
$snp[$n]=$line;
$n++;
}
}
open(input,"$ARGV[1]");
open(output,">$ARGV[2]");
$n=0;
while($line=<input>)
{
@a=split("\t",$line,5);
$a[4]=~s/\t/\,/;
print output $snp[$n],"\t",$a[2],"\t",$a[3],"\t",$a[4];
$n++;
}

