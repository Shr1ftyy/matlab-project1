function unitVecs = computeUnitVecMatrix(posMatrix)
  dims = size(posMatrix);
  nParticles = dims(1);
  unitVecs = [];
  for i=1:nParticles
    particleUnitVecs = [];
    for j=1:nParticles
      displacement = posMatrix(i, 1:end) - posMatrix(j, 1:end);
      dispMag = vecnorm(displacement); % magnitude of vector
      unitVec = displacement/dispMag;
      dimUnitVec = size(unitVec);
      if isnan(unitVec)
        particleUnitVecs = cat(3,particleUnitVecs, zeros(dimUnitVec));
      else
        particleUnitVecs = cat(3,particleUnitVecs, unitVec);
      end
%     disp(displacementsParticleI);
    end

    % outputs tensor containing 
    unitVecs = cat(4, unitVecs, particleUnitVecs);
  end
end