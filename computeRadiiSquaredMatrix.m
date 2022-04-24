function radiiSquared = computeRadiiSquaredMatrix(posMatrix)
  displacementBetweens = [];
  dims = size(posMatrix);
  rows = dims(1);
    for index=2:rows
      disp(index);
      displacementVec = posMatrix(index, 1:3) - posMatrix(index-1, 1:3);
      displacementVecMag = vecnorm(displacementVec);
      displacementBetweens = [displacementBetweens; displacementVecMag];
    end
  disp(displacementBetweens);
  radiiSquared = displacementBetweens; % raises every element to the power of 2
end