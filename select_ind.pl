if($#ARGV<1)
{
print "input output\n";
exit;
}
open(input,"$ARGV[0]");
open(output,">$ARGV[1]");
$old=-2000;
$line=<input>;
print output $line;
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line,3);
if($a[1]-$old>=2000)
{
print output $line,"\n";
$old=$a[1];
}
}
}

