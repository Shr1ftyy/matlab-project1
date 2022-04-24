function unitVecs = computeUnitVecMatrix(posMatrix)
% Computes the unit vector pointing from each particle to the other, and stores them into a matrix
  unitVecs = [];
  dims = size(posMatrix);
  rows = dims(1);
    for index=2:rows
      disp(index);
      displacementVec = posMatrix(index, 1:3) - posMatrix(index-1, 1:3);
      displacementVecMag = vecnorm(displacementVec);
      unitVec = displacementVec * (1/displacementVecMag);
      unitVecs = [unitVecs; unitVec];
    end
end

