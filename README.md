N-body simulation of our solar system with 8 planets and 2 Trojans in orbit
====

Description: Main program N_body_problem.m  simulates the positions and velocities of 8 planets and 2 Trojans orbiting the Sun. 
The main feautures of this program are the Runge-Kutta algorithm and the function called g_functions. 
The latter computes the total force acting on all particles and then passes it on to the Runge-Kutta update rule to predict the next iteration element.

## Figures:

![positions_planets](https://github.com/ianpaga/N_body_problem/assets/57350668/166da78d-0e63-4b76-8ac8-59b6466b8f87)
![error](https://github.com/ianpaga/N_body_problem/assets/57350668/6e8e7909-d7c6-4f06-a11c-fc14ee4804a0)
![full_solarsystem](https://github.com/ianpaga/N_body_problem/assets/57350668/90325cc9-fe12-4dcb-8d6c-fea59d4a68a5)
![inner_planets](https://github.com/ianpaga/N_body_problem/assets/57350668/b4da76cf-971d-4119-b916-9abddab5d5f3)
![sun_orbit](https://github.com/ianpaga/N_body_problem/assets/57350668/885200da-9ede-414c-89f1-a6f7de44b050)
![trojans_solarsystem](https://github.com/ianpaga/N_body_problem/assets/57350668/516d7f58-c715-46dc-a5de-cd9bc6ea2402)
![x_distance](https://github.com/ianpaga/N_body_problem/assets/57350668/6501392e-c090-4d03-af9a-83bba9d5def7)
![x_distance2](https://github.com/ianpaga/N_body_problem/assets/57350668/f0ac4e7d-faa9-44cb-8c67-de30c18301a8)
![error_difference](https://github.com/ianpaga/N_body_problem/assets/57350668/831aeb93-f0f7-4e4f-a3dc-ea2cf5d9767d)

## Requirements:

- MATLAB (version 2017 or later)

  Running this N_body_problem.m (MATLAB) code will generate plots in /plots. You can also run the simplified two_body_problem.m file and quantify the differences between
  a full N-body approach and a two-body approximation of our solar system.
