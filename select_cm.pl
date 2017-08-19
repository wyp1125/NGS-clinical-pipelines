open(input,"$ARGV[0]");
open(output,">$ARGV[1]");
while($line=<input>)
{
chomp($line);
@a=split("\t",$line);
if($a[4]>0.05 && $a[5]>0.05)
{
print output $line,"\n";
}
}
