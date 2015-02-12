


    rm -r scan
    mkdir scan 

    current=$PWD

   natom=16
   total_line=`expr ${natom} + 2`

   
      total=0 
      for ((m = 1; m <= 42; m++ )) 
      do 
         echo $m

         for ((n = 1; n <= 21; n++ ))
         do
             
             		 
             total=`expr ${total} + ${total_line}`
#             echo "$m, $n, $total"	     

             mkdir ./scan/angle_${m}_${n}
	     
	     head -n$total stru_ang.dat > tmp
             echo $natom                  >   ./scan/angle_${m}_${n}/s1_${m}_${n}.xyz
             echo ""                      >>  ./scan/angle_${m}_${n}/s1_${m}_${n}.xyz
	     tail -n$natom   tmp          >>  ./scan/angle_${m}_${n}/s1_${m}_${n}.xyz	
             x2t    ./scan/angle_${m}_${n}/s1_${m}_${n}.xyz  >> ./scan/angle_${m}_${n}/coord
      
             cp  basis     ./scan/angle_${m}_${n}/
             cp  control   ./scan/angle_${m}_${n}/
             cp  metastase ./scan/angle_${m}_${n}/
             cp  mos       ./scan/angle_${m}_${n}/
             cp turbomole_opt.sh ./scan/angle_${m}_${n}/

        done
      done
