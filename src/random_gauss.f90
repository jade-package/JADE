!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  Program file name: random_gauss.f90                                    !
!                                                                         !
!                                                                         !
!  Last modified: November 13, 2009                                       !
!                                                                         !
!  (1) This F90 program is created for the book, "An Introduction to      !
!      Computational Physics, 2nd Edition," written by Tao Pang and       !
!      published by Cambridge University Press on January 19, 2006.       !
!                                                                         !
!  (2) No warranties, express or implied, are made for this program.      !
!                                                                         !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
MODULE CSEED
  INTEGER :: SEED
END MODULE CSEED
!
PROGRAM RANDOM_GAUSS
!
! An example of generating an array of Gaussian random
! numbers.
!
  USE CSEED
  IMPLICIT NONE
  INTEGER, PARAMETER :: N=10000
  INTEGER :: I, IC
  INTEGER, DIMENSION (8) :: T
  REAL :: X,Y
!
! Initiate the seed from the current date time
!
  CALL DATE_AND_TIME(VALUES = T)
  SEED = T(1)+70*(T(2)+12*(T(3)+31*(T(5)+23*(T(6)+59*T(7)))))
  IF (MOD(SEED,2).EQ.0) SEED = SEED-1
!
  IC = 0
  DO I = 1, N-1, 2
    CALL RANG(X,Y)
    !WRITE(6, *) "The ", I, "th Gaussian number is: ", X
    !WRITE(6, *) "The ", I+1, "th Gaussian number is: ", Y

    WRITE(6, *) X, I
    WRITE(6, *)  Y, I+1

  END DO
END PROGRAM RANDOM_GAUSS
!
SUBROUTINE RANG (X,Y)
!
! Two Gaussian random numbers generated from two uniform random
! numbers.
!
  IMPLICIT NONE
  REAL, INTENT (OUT) :: X,Y
  REAL :: PI,R1,R2,R,RANF
!
  PI = 4.0*ATAN(1.0)
  R1 = -ALOG(1.0-RANF())
  R2 = 2.0*PI*RANF()
  R1 = SQRT(2.0*R1)
  X  = R1*COS(R2)
  Y  = R1*SIN(R2)
END SUBROUTINE RANG
!
FUNCTION RANF() RESULT (CR)
!
! Function to generate a uniform random number in [0,1]
! following x(i+1)=a*x(i) mod c with a=7** 5 and
! c=2** 31-1.  Here the seed is a global variable.
!
  USE CSEED
  IMPLICIT NONE
  INTEGER :: H, L, T, A, C, Q, R
  DATA A/16807/, C/2147483647/, Q/127773/, R/2836/
  REAL :: CR
!
  H = SEED/Q
  L = MOD(SEED, Q)
  T = A*L - R*H
  IF (T .GT. 0) THEN
    SEED = T
  ELSE
    SEED = C + T
  END IF
  CR = SEED/FLOAT(C)
END FUNCTION RANF
