% This script takes user input 
% (position vectors of point particles, masses), 
% and runs a loop of computing their positions over time given
% and visualizes in 3d space.

NBodies = input("How many bodies would you like to run a simulation of?: \n");
v = loadVecs(NBodies);

