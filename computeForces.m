function forceVecs = computeForces(massVector, radiiSquared, radUnitVecs)
%COMPUTEFORCES Computes forces given position, mass, distance between point particles and unit vectors.
  dimPosMat = size(massVector);
  numParticles = dimPosMat(1); % number of particles
  G =  6.67384e-11; % gravitational constant
  forceVecs = [];
  invRadiiSquared = power(radiiSquared, -1);
  for i=1:numParticles
    forcesOnParticleIByAllJs = [];
    for j=1:numParticles
      scalar = -G * (massVector(i,1) * massVector(j,1)) * invRadiiSquared(i,j);
      forceOnIfromJ = scalar * radUnitVecs(:,:,i,j);
      forcesOnParticleIByAllJs = cat(3, forcesOnParticleIByAllJs, forceOnIfromJ);
    end
    forceVecs = cat(4, forceVecs, forcesOnParticleIByAllJs);
  end
  
end

