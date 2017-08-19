for($i=0;$i<22;$i++)
{
$d="chr".($i+1);
if($i==22)
{
$d="chrX";
}
open(output,">sub/$i.sub");
print output "#!/bin/sh\n";
print output "#PBS -A proc_$i\n";
print output "#PBS -j oe\n";
print output "#PBS -l select=1:ncpus=1:mem=128gb\n";
#print output "#PBS -l walltime=1:59:00\n";
print output "work_dir=/bigdata0/users/wangyu/admix8\n";
print output "cd \$work_dir\n";
print output "perl convert_2_plink_simple.pl 1kg_mo_cmb_ind/$d.gt plink/$d\n";
sleep(0.1);
system("qsub sub\/$i.sub");
}
