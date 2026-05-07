module run_star_extras
   integer(dp) :: step_mod = 0
   real(dp) :: m_sol = 1.9892d33 
   real(dp) :: m_buff_i=0.0
   real(dp) :: m_buff_t=0.0
   real(dp) :: m_buff_earth=3.0024584d-6
   
   
   integer function extras_check_model(id)
      integer, intent(in) :: id
      integer :: ierr
      type (star_info), pointer :: s
      ierr = 0
      call star_ptr(id, s, ierr)
      if (ierr /= 0) return
      extras_check_model = keep_going  
   
      if (s% x_logical_ctrl(10)) then
         !if (s% center_h1<=0.65 .and. step_mod==0 .and.m_buff_i==0) then
         if (s% star_age>=10d9 .and. step_mod==0 .and.m_buff_i==0) then
            !write (*,*) 'Accretion started !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
            m_buff_i= s% mstar/m_sol
            m_buff_t= s% mstar/m_sol
            step_mod=step_mod+1
            s% max_years_for_timestep = 1d4
            s% mass_change=1.d-10!step_mod*1.d-13
            Dt_accretion=1.0
   
            if (s% x_logical_ctrl(11)) then
               s% accretion_h1 = 0.712859994
               s% accretion_h2 = 0
               s% accretion_he3 = 0
               s% accretion_he4 = 0.287140006
               s% accretion_zfracs = -1
            endif
         elseif (s% x_logical_ctrl(10) .and.  step_mod == 1  .and. (m_buff_t-m_buff_i)>=s% x_ctrl(4)*m_buff_earth ) then
            !write (*,*) 'Accretion stopped !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
            s% mass_change=0
            s% max_years_for_timestep = 0
            s% force_timestep_min_years = 1d7
            step_mod=step_mod+1
   
         elseif (s% x_logical_ctrl(10) .and. step_mod>=2 .and.  step_mod <= 4) then
            s% max_years_for_timestep = 0
            step_mod=step_mod+1
         elseif (s% x_logical_ctrl(10) .and. step_mod>4) then
            s% force_timestep_min_years = 0
   
         elseif  (step_mod==1 .and. m_buff_i>0) then
            m_buff_t= s% mstar/m_sol
   
         if (s% x_logical_ctrl(11) .and. (m_buff_t-m_buff_i)>=s% x_ctrl(5)*m_buff_earth) then
            !write (*,*) 'Change to only metals !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
            s% accretion_h1 = 0
            s% accretion_h2 = 0
            s% accretion_he3 = 0
            s% accretion_he4 = 0
            s% accretion_zfracs = 6
            s% x_logical_ctrl(11) = .False.
         endif
         endif
      endif
   
   
      if (extras_check_model == terminate) s% termination_code = t_extras_check_model
   end function extras_check_model
end module run_star_extras
