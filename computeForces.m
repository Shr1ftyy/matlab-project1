function netForceOnPs = computeForces(massVector, radiiSquared, radUnitVecs)
%COMPUTEFORCES Computes forces given position, mass, distance between point particles and unit vectors.
  dimPosMat = size(massVector);
  numParticles = dimPosMat(1); % number of particles
  G =  6.67384e-11; % gravitational constant
  forceVecs = [];
  netForceOnPs = [];
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
  forceDims = size(forceVecs);
  spatialDims = forceDims(2);

  for i=1:numParticles
    netForceOnP_i = zeros(1, spatialDims);
    for j=1:numParticles
      force = forceVecs(:,:,i,j);
%       disp(force)
      if ~(isnan(force))
        netForceOnP_i = netForceOnP_i + force;
      end
    end
    netForceOnPs = [netForceOnPs; netForceOnP_i];
  end
end

