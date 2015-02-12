



    current=$PWD

      rm ./result/energy*


      for ((m = 1; m <= 42; m++ )) 
      do

         for ((n = 1; n <= 21; n++ ))
         do
             
                                		 
             grep "total energy      =" < ./scan/angle_${m}_${n}/dscf.out >> ./result/energy_$m
	     
       

        done
      done
