function forceVecs = computeForces(massVector, radiiSquared, radUnitVecs)
%COMPUTEFORCES Computes forces given position, mass, distance between point particles and unit vectors.
  dimPosMat = size(posMatrix);
  numParticles = dimPosMat(1); % number of particles
  G =  6.67384e-11; % gravitational constant
  % I know, I KNOW! O(n^2) blah blah blah... it's not pretty but it works
  % OK...
  forcesVecs = [];
  invRadiiSquared = power(radiiSquared, -1);
  
end

