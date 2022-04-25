function newPositionMatrix = updateSimGivenLast(posMat, vMat, aMat, mMat)
  % Inputs:
  % posMat - n x 3 matrix, with each row containing 3d pos
  % vMat - n x 3 matrix, with each row containing 3d velocity
  % vMat - n x 3 matrix, with each row containing 3d acceleration
  % mMat - n x 1 matrix, with each row containing masses
  % Calculates the positon matrix of all point particles given inMatrix and
  % timePassed by following the using the force vectors of all particles 
  % in vectorized form to compute displacements
  % F = G * dot((dot(m_1, m_2)/r^2) r^2)
  radiiSquared = computeRadiiSquaredMatrix(posMat);
  radUnitVecs = computeUnitVecMatrix(posMat);
  forceVecs = computeForces(massMatrix, radiiSquared, radUnitVecs);
%   newPositionMatrix = forceVecs  * power(massMatrix, -1) ; 
end
  
 