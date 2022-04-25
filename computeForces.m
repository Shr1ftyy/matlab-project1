function forceVecs = computeForces(massVector, radiiSquared, radUnitVecs)
%COMPUTEFORCES Computes forces given position, mass, distance between point particles and unit vectors.
  dimPosMat = size(posMatrix);
  numParticles = dimPosMat(1); % number of particles
  G =  6.67384e-11; % gravitational constant
  forcesVecs = [];
  invRadiiSquared = power(radiiSquared, -1);
  
  
end

