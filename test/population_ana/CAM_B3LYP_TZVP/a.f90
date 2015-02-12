program main
integer:: type_input = 4
          if (type_input .eq. 4 ) then
             write (*,*) "Read CI vectors and mos from Gaussian output!" 
             i_status = system ("./a.py")
             if (i_status  .ne. 0) then
                write (*,*) "The interface errors!", i_status
                write (*,*) "Check Gaussian calculations!"
                stop
             endif
          endif

end
