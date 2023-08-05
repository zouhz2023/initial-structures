#！/bin/bash -f 
export CUDA_VISIBLE_DEVICES=0
$AMBERHOME/bin/pmemd.cuda -O -i min1.in -o min1.out -p TTRapo_sol.prmtop -c TTRapo_sol.inpcrd -r min1.rst -ref TTRapo_sol.inpcrd
$AMBERHOME/bin/pmemd.cuda -O -i min2.in -o min2.out -p TTRapo_sol.prmtop -c min1.rst -r min2.rst -ref min1.rst -x min2.nc
$AMBERHOME/bin/pmemd.cuda -O -i min3.in -o min3.out -p TTRapo_sol.prmtop -c min2.rst -r min3.rst -ref min2.rst -x min3.nc
$AMBERHOME/bin/pmemd.cuda -O -i heat.in -o heat.out -p TTRapo_sol.prmtop -c min3.rst -r heat.rst -ref min3.rst -x heat.nc
$AMBERHOME/bin/pmemd.cuda -O -i eq1.in -o eq1.out -p TTRapo_sol.prmtop -c heat.rst -r eq1.rst -ref heat.rst -x eq1.nc 
$AMBERHOME/bin/pmemd.cuda -O -i eq2.in -o eq2.out -p TTRapo_sol.prmtop -c eq1.rst -r eq2.rst -ref eq1.rst -x eq2.nc
$AMBERHOME/bin/pmemd.cuda -O -i eq3.in -o eq3.out -p TTRapo_sol.prmtop -c eq2.rst -r eq3.rst -ref eq2.rst -x eq3.nc
$AMBERHOME/bin/pmemd.cuda -O -i eq4.in -o eq4.out -p TTRapo_sol.prmtop -c eq3.rst -r eq4.rst -ref eq3.rst -x eq4.nc
$AMBERHOME/bin/pmemd.cuda -O -i eq5.in -o eq5.out -p TTRapo_sol.prmtop -c eq4.rst -r eq5.rst -ref eq4.rst -x eq5.nc
$AMBERHOME/bin/pmemd.cuda -O -i md.in -o md.out -p TTRapo_sol.prmtop -c eq5.rst -r md.rst -ref eq5.rst -x md.nc
