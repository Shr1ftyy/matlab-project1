% This script takes user input 
% (position vectors of point particles, masses), 
% and runs a loop of computing their positions over time
% and visualizes in them 3d space.

% option = input("Would you like to load a .csv file of vectors or manually input them?")
NBodies = input("How many bodies would you like to run a simulation of (2 or more)?: \n");
assert(NBodies >= 2);
initialVectors = loadVecs(NBodies);

computedPositions = 

