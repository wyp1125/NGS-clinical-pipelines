$vt_path="/root/software/vt/vt";
$b=`ls *.vcf`;
@a=split("\n",$b);
for($i=0;$i<=$#a;$i++)
{
print $a[$i],"\n";
$ofl=$a[$i];
$ofl=~s/\.vcf//;
$cmd="$vt_path decompose $a[$i] -o norm1/$a[$i]";
system("$cmd");
$cmd="$vt_path decompose_blocksub -a norm1/$a[$i] -o norm2/$a[$i]";
system("$cmd");
if($a[$i]=~/^master/) #for the VCFs converted from masterVar files
{
$cmd="$vt_path normalize -n norm2/$a[$i] -r refgenome/ref2.fa -o norm3/$a[$i]";
}
else 
{
$cmd="$vt_path normalize -n norm2/$a[$i] -r refgenome/ref1.fa -o norm3/$a[$i]";
}
system("$cmd");
}
