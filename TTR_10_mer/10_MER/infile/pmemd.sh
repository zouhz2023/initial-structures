#！/bin/bash -f 
export CUDA_VISIBLE_DEVICES=1
pmemd.cuda -O -i min1.in -o min1.out -p ../10mer_sol.prmtop -c ../10mer_sol.inpcrd -r min1.rst -ref ../10mer_sol.inpcrd
pmemd.cuda -O -i min2.in -o min2.out -p ../10mer_sol.prmtop -c min1.rst -r min2.rst -ref min1.rst -x min2.nc
pmemd.cuda -O -i min3.in -o min3.out -p ../10mer_sol.prmtop -c min2.rst -r min3.rst -ref min2.rst -x min3.nc
pmemd.cuda -O -i heat.in -o heat.out -p ../10mer_sol.prmtop -c min3.rst -r heat.rst -ref min3.rst -x heat.nc
pmemd.cuda -O -i eq1.in -o eq1.out -p ../10mer_sol.prmtop -c heat.rst -r eq1.rst -ref heat.rst -x eq1.nc 
pmemd.cuda -O -i eq2.in -o eq2.out -p ../10mer_sol.prmtop -c eq1.rst -r eq2.rst -ref eq1.rst -x eq2.nc
pmemd.cuda -O -i eq3.in -o eq3.out -p ../10mer_sol.prmtop -c eq2.rst -r eq3.rst -ref eq2.rst -x eq3.nc
pmemd.cuda -O -i eq4.in -o eq4.out -p ../10mer_sol.prmtop -c eq3.rst -r eq4.rst -ref eq3.rst -x eq4.nc
pmemd.cuda -O -i eq5.in -o eq5.out -p ../10mer_sol.prmtop -c eq4.rst -r eq5.rst -ref eq4.rst -x eq5.nc
pmemd.cuda -O -i md.in -o md1.out -p ../10mer_sol.prmtop -c eq5.rst -r md1.rst -ref eq5.rst -x md1.nc
pmemd.cuda -O -i md.in -o md2.out -p ../10mer_sol.prmtop -c md1.rst -r md2.rst -ref md1.rst -x md2.nc

