



    current=$PWD

      rm ./result/energy*


      for ((m = 1; m <= 42; m++ )) 
      do

         for ((n = 1; n <= 21; n++ ))
         do
             
                                		 
             grep "SCF Done:  E(RHF)" < ./scan/angle_${m}_${n}/s1_${m}_${n}.log >> ./result/energy_$m
	     
       

        done
      done
