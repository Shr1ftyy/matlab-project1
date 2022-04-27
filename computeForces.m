function netForceOnPs = computeForces(massVector, radiiSquared, radUnitVecs)
%COMPUTEFORCES Computes forces given position, mass, distance between point particles and unit vectors.
  dimPosMat = size(massVector);
  numParticles = dimPosMat(1); % number of particles
  G =  6.67384e-11; % gravitational constant
  forceVecs = []; % tensor of all force vecs on each particle 
  netForceOnPs = []; % net gravitation force on each particle
  invRadiiSquared = radiiSquared.^(-1); % element wise inverse of square distance tensor
  for i=1:numParticles
    forcesOnParticleIByAllJs = [];
    for j=1:numParticles
      scalar = -G * (massVector(i,1) * massVector(j,1)) * invRadiiSquared(i,j); % scalar term of newton's law of gravitation
      %  newton's law of gravitation applied to calculate force on particle
      %  i by particle j
      forceOnIfromJ = scalar * radUnitVecs(:,:,i,j);  
      % appending to forcesOnParticleIByAllJs, will be inserted to another
      % array soon
      forcesOnParticleIByAllJs = cat(3, forcesOnParticleIByAllJs, forceOnIfromJ);
    end
    forceVecs = cat(4, forceVecs, forcesOnParticleIByAllJs);
  end
  forceDims = size(forceVecs);
  spatialDims = forceDims(2);

  % calculates net force on each particle by every other particle, and
  % organizes them into the multi dimensional array netForceOnPs
  for i=1:numParticles
    netForceOnP_i = zeros(1, spatialDims);
    for j=1:numParticles
      force = forceVecs(:,:,i,j);
      if ~(isnan(force))
        netForceOnP_i = netForceOnP_i + force;
      end
    end
    netForceOnPs = [netForceOnPs; netForceOnP_i];
  end
end

