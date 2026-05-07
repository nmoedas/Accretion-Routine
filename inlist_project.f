
&star_job !
   relax_tau_factor = .true.       
   relax_to_this_tau_factor = 1d-5 
   create_pre_main_sequence_model = .true.
   pre_ms_relax_num_steps = 50
   pre_ms_T_c = 5e5 
   
   change_net=.true.
   new_net_name= 'Extra_elem.net' !

   eos_file_prefix = 'mesa'
   kappa_file_prefix ='a09'              
   kappa_lowT_prefix = 'lowT_fa05_a09p' ! for lower temperatures.
   kappa_CO_prefix = 'a09_co'

   initial_zfracs = 6 
   set_rates_preference = .true.
   new_rates_preference = 1 

   set_rate_c12ag = 'Kunz'
   set_rate_n14pg = 'jina reaclib'
   
   profile_columns_file = 'profile.list'
   history_columns_file = 'history.list'
   pgstar_flag = .false.  
/

&controls !
   profile_data_suffix = '.profile'

   
   initial_mass =  1. 
   initial_z = 0.01303 ! solar calibration value: 0.01756
   Zbase =  0.01303  ! to be set equal to initial_z 
   initial_y = 0.25502 




   write_pulse_data_with_profile = .true. !.true. ! LOSC file in saving routine
   pulse_data_format = 'GYRE' ! e.g., FGONG, OSC, ...
   add_atmosphere_to_pulse_data = .false.
   add_center_point_to_pulse_data = .true. ! add point for r=0             
   add_double_points_to_pulse_data = .false.
   
   photo_interval = 200
   photo_digits = 5

   write_profiles_flag = .false.
   max_num_profile_models = 100000
   profile_interval = 10  
   history_interval = 1
   terminal_interval = 10
   write_header_frequency = 10
   
   mixing_length_alpha = 1.6966878 
   MLT_option = 'Cox'
   
   overshoot_D_min=1e-99 
   overshoot_scheme(1) = 'exponential'
   overshoot_zone_type(1) = 'burn_H' 
   overshoot_zone_loc(1) = 'core'      
   overshoot_bdy_loc(1) = 'top'      
   overshoot_f(1) = 0.01001
   overshoot_f0(1) = 0.00001
   
   overshoot_D0 = 0d0
   overshoot_Delta0 = 1d0
   
   use_Ledoux_criterion = .false.
   num_cells_for_smooth_gradL_composition_term = 0
   alpha_semiconvection = 0.0
   do_conv_premix = .false.
   
   T_mix_limit=1e4  
   use_gold_tolerances = .false.
   use_dedt_form_of_energy_eqn = .false.
   screening_mode = 'extended'
   
   use_Type2_opacities=.true.  
   cubic_interpolation_in_Z = .true.
   kap_Type2_full_off_X = 1d-6 
   kap_Type2_full_on_X = 1d-10 
   kap_Type2_full_off_dZ = 1d-99 
   kap_Type2_full_on_dZ = 1d-99 
   
   ! timestep&mesh
   max_allowed_nz = 10000 
   min_timestep_limit = 1d-10
   mesh_delta_coeff = 0.5
   varcontrol_target = 2d-4
   timestep_dt_factor = 0.9 
   delta_lg_XH_cntr_min = -6 
   delta_lg_XH_cntr_max = 1 
   delta_lg_XH_cntr_limit = 0.005 
   delta_lg_XH_cntr_hard_limit = -1
   
   delta_HR_ds_L = 1
   delta_HR_ds_Teff = 10
   delta_HR_limit = 0.01
   
   warn_when_large_rel_run_E_err = 1.0d99
   
   atm_option = 'T_tau'
   atm_T_tau_relation = 'Krishna_Swamy'
   atm_T_tau_opacity = 'fixed' 
   
   get_delta_nu_from_scaled_solar = .true.
   calculate_Brunt_N2 = .true.
   brunt_N2_coefficient = 1 
   num_cells_for_smooth_brunt_B = 0
   
   do_element_diffusion = .true.
   diffusion_dt_limit = 1 
   diffusion_use_iben_macdonald = .false.
   
   diffusion_min_dq_at_surface = 5d-9
   diffusion_min_T_at_surface = 5d4
   diffusion_min_dq_ratio_at_surface = 4
   diffusion_v_max = 1d-1
   diffusion_dt_div_timescale = 1.0
   diffusion_max_iters_per_substep = 20
   diffusion_max_retries_per_substep = 20
   diffusion_steps_limit = 200
   diffusion_steps_hard_limit = 400
   diffusion_iters_limit = 500
   diffusion_iters_hard_limit = 1000
   diffusion_tol_correction_max = 3d-1
   diffusion_tol_correction_norm = 3d-3
   diffusion_min_X_hard_limit = -5d-3
   diffusion_X_total_atol = 1d-9
   diffusion_X_total_rtol = 1d-6
   diffusion_upwind_abs_v_limit = 1d-6
   diffusion_T_full_on = 1d3
   diffusion_T_full_off = 1d3
   diffusion_calculates_ionization = .true.
   diffusion_nsmooth_typical_charge = 10 
   diffusion_max_T_for_radaccel = 1d8
   diffusion_screening_for_radaccel = .true.
 

   diffusion_num_classes = 14 
   diffusion_class_representative(1) = 'h1'
   diffusion_class_representative(2) = 'he4'
   diffusion_class_representative(3) = 'c12'
   diffusion_class_representative(4) = 'n14'
   diffusion_class_representative(5) = 'o16'
   diffusion_class_representative(6) = 'ne20'
   diffusion_class_representative(7) = 'na23'
   diffusion_class_representative(8) = 'mg24'
   diffusion_class_representative(9) = 'al27'
   diffusion_class_representative(10) = 'si28'
   diffusion_class_representative(11) = 's32'
   diffusion_class_representative(12) = 'ca40'
   diffusion_class_representative(13) = 'fe56'
   diffusion_class_representative(14) = 'ni58'
   
   diffusion_class_A_max(1) = 2
   diffusion_class_A_max(2) = 4
   diffusion_class_A_max(3) = 12
   diffusion_class_A_max(4) = 14
   diffusion_class_A_max(5) = 16
   diffusion_class_A_max(6) = 20
   diffusion_class_A_max(7) = 23
   diffusion_class_A_max(8) = 24
   diffusion_class_A_max(9) = 27
   diffusion_class_A_max(10) = 28
   diffusion_class_A_max(11) = 32
   diffusion_class_A_max(12) = 40
   diffusion_class_A_max(13) = 56
   diffusion_class_A_max(14) = 58
   diffusion_rtol_for_isolve = 1d-4
   diffusion_atol_for_isolve = 1d-5
   diffusion_maxsteps_for_isolve = 1000
   diffusion_isolve_solver = 'ros2_solver'

   !-----------------------Radiative accelerations SVP hook------------------------------------------

   x_logical_ctrl(5) = .True.
   x_logical_ctrl(6) = .True.  ! ignore OP mono 
   x_logical_ctrl(7) = .False. !consider full Ionisation


   !-----------------------TURBULENT DIFFUSION---------------------------------

   x_integer_ctrl(1)=1 ! 0 no Dturb, 1 Verma prescreption, 2 Montréal prescreption
   x_integer_ctrl(2)=1 ! 1 --ref mass; 2 -- ref Temperature;
   x_ctrl(1) = 6.8d-3  ! Value of reference depth
   x_ctrl(2) = 10000   ! C Dturb
   x_ctrl(3) = 4       ! N Dturb

/
