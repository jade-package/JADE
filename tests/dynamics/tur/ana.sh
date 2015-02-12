    rm *_time_ana

     grep "The current state"  < ele_time.out > state_time_ana

     grep "Potential energy"   <  hop_all_time.out >  pes_time_ana

     grep "Current potential energy"  < hop_all_time.out >  pes_md_time_ana

     grep "<psi_i| d/dt | psi_j>" <  hop_all_time.out > nac_time_ana

     grep " population"  < hop_all_time.out > pop_time_ana

     grep "Hopping probability   "  < ele_time.out > prob_time_ana

     grep "Hopping probability (averaged)" < ele_time.out > prob_ave_time_ana

