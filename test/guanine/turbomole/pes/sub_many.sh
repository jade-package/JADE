



    current=$PWD
    curr=$current

      for ((m = 1; m <= 42; m++ )) 
      do

         for ((n = 1; n <= 21; n++ ))
         do
             
 
             cd ./scan/angle_${m}_${n}
	     
              bash   turbomole_opt.sh

              cd $curr

        done
      done
