% This script takes user input 
% (position vectors of point particles, masses), 
% and runs a loop of computing their positions over time
% and visualizes in them 3d space.

% option = input("Would you like to load a .csv file of vectors or manually input them?")
NBodies = input("How many bodies would you like to run a simulation of (2 or more)?: \n");
assert(NBodies >= 2);
loadedVecs = loadVecs(NBodies);
masses = loadedVecs(1:end, 4);
posMat = loadedVecs(1:end, 1:3);
% initial velocity and acceleration are zero for all particles
velocityMat = zeros(size(posMat));
accelMat = zeros(size(posMat));
t = 0; % intiial time in seconds 
% dt=1, this cannot be changed (this is primarly done to simplify calculations, and it makes it
% the simulation inaccurate compared to empirical results anyway (assuming results are measured
% in discrete timesteps of 1 second))

while true
  deltaPos = updateSimGivenLast(posMat, velocityMat, accelMat, masses, dt);
  posMat = posMat + deltaPos;

  
end

% computedPositions = 

