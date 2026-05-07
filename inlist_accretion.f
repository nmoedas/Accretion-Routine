!mass accretion used in ....
!For the instantaneous/punctual accretion a small routine was implemented in run_star_extra

&controls ! 

mass_change = 0 !  Rate of accretion (Msun/year)

x_logical_ctrl(10) = .True.  !To start punctual accretion set mass_change=0 as it will be define new value in run_star_extra
x_ctrl(4) = 6                ! total target of mass gain in earth masses

x_logical_ctrl(11) = .False. ! turn on mass accretion of pure X and Y
x_ctrl(5) = 0                ! target of mass accretion pure X and Y in earth masses
                             ! mass accretion of Z is x_ctrl(4)-x_ctrl(5)
				
accrete_same_as_surface = .false.      

accrete_given_mass_fractions = .false.

thermohaline_coeff = 1
thermohaline_option = 'Brown_Garaud_Stellmach_13'
use_Ledoux_criterion = .True.


accretion_h1 = 0
accretion_h2 = 0
accretion_he3 = 0
accretion_he4 = 0
accretion_zfracs = 6

!when considering different element mixture

!z_fraction_li = 1.5d-6
!z_fraction_c = 0.0341856
!z_fraction_n = 0.0029553
!z_fraction_o = 0.4659682
!z_fraction_mg = 0.0954898
!z_fraction_al = 0.0084205
!z_fraction_si = 0.0525079
!z_fraction_s = 0.1053748
!z_fraction_ca = 0.0090609
!z_fraction_fe = 0.1824933


/
