for($i=1;$i<23;$i++)
{
$d="chr$i";
open(output,">sub/$i.sub");
print output "#!/bin/sh\n";
print output "#PBS -A proc_$i\n";
print output "#PBS -j oe\n";
print output "#PBS -l select=1:ncpus=1:mem=8gb\n";
#print output "#PBS -l walltime=1:59:00\n";
print output "work_dir=/bigdata0/users/wangyu/admix8\n";
print output "cd \$work_dir\n";
print output "perl select_ind.pl 1kg_mo_cmb/$d.gt 1kg_mo_cmb_ind/$d.gt\n";
sleep(0.1);
system("qsub sub\/$i.sub");
}
