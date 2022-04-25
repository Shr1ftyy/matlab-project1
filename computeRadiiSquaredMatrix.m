function radiiSquared = computeRadiiSquaredMatrix(posMatrix)
  dims = size(posMatrix);
  nParticles = dims(1);
  distanceBetweens = [];
  for i=1:nParticles
    displacementsParticleI = [];
    for j=1:nParticles
      displacement = posMatrix(i, 1:end) - posMatrix(j, 1:end);
      dispMag = vecnorm(displacement);
      displacementsParticleI = [displacementsParticleI, dispMag];
%     disp(displacementsParticleI);
    end

    if (isempty(distanceBetweens))
      distanceBetweens = displacementsParticleI;
    else
      distanceBetweens = [distanceBetweens; displacementsParticleI];
    end
  end

  radiiSquared = power(distanceBetweens, 2); % element wise squaring
end