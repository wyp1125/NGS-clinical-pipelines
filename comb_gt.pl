if($#ARGV<3)
{
print "cm_pos 101_chr 1kg_chr output\n";
exit;
}
open(input,"$ARGV[0]");
%h=();
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line);
$h{$a[1]}="$a[2]\t$a[3]";
}
}
open(input,"$ARGV[1]");
$line=<input>;
chomp($line);
$head=$line;
%k=();
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line,3);
if(exists $h{$a[1]})
{
$k{$a[1]}=$line;
}
}
}
open(input,"$ARGV[2]");
open(output,">$ARGV[3]");
while($line=<input>)
{
chomp($line);
if($line ne "")
{
if($line=~/^\#CHROM/)
{
print "aaa\n";
@a=split("\t",$line,10);
$head=$head."\t".$a[9];
print output $head,"\n";
}
if($line!~/^\#/)
{
@a=split("\t",$line,10);
if(exists $h{$a[1]})
{
if($a[3]=~/^[ACGT]$/ && $a[4]=~/^[ACGT]$/)
{
#print $h{$a[1]},"\t",$a[3],"\t",$a[4],"\n";
print output $k{$a[1]},&conv($a[3],$a[4],$a[9]),"\n";
}
}
}
}
}
sub conv
{
my @gt=();
$gt[0]=$_[0];
$gt[1]=$_[1];
my @aa=split("\t",$_[2]);
my $oline="";
my $nt="";
for(my $ii=0;$ii<=$#aa;$ii++)
{
@bb=split("\\|",$aa[$ii]);
$nt=$gt[$bb[0]]."\/".$gt[$bb[1]];
if($gt[$bb[0]] gt $gt[$bb[1]])
{
$nt=$gt[$bb[1]]."\/".$gt[$bb[0]];
}
$oline=$oline."\t".$nt;
}
return $oline;
}

