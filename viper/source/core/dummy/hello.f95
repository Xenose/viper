! Hello.f95

module VIPER_FORTRAN_HELLO_MODLUE
   use, intrinsic :: iso_c_binding
   implicit none

contains
   subroutine VIPER_FORTRAN_HELLO() bind(C, name="ViperFortranHello")
      write(*,*) "Hello, World!"
   end subroutine VIPER_FORTRAN_HELLO

end module VIPER_FORTRAN_HELLO_MODLUE
