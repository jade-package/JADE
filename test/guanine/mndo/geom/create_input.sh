


    rm -r scan
    mkdir scan 

    current=$PWD

   natom=16
   total_line=`expr ${natom} + 2`

   
      total=0 
      for ((m = 1; m <= 42; m++ )) 
      do

         for ((n = 1; n <= 21; n++ ))
         do
             
             		 
             total=`expr ${total} + ${total_line}`
#             echo "$m, $n, $total"	     

             mkdir ./scan/angle_${m}_${n}
             cat  s0.com > ./scan/angle_${m}_${n}/s1_${m}_${n}.com
	     
	     head -n$total stru_ang.dat > tmp
	     tail -n$natom tmp          >>  ./scan/angle_${m}_${n}/s1_${m}_${n}.com

             echo "  "        >> ./scan/angle_${m}_${n}/s1_${m}_${n}.com
       

        done
      done
