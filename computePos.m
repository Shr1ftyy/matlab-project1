function newPositionMatrix = posAtTime(inMatrix, timePassed)
  % Inputs:
  % inMatrix - n x 4 matrix, with each row containing 3d pos and mass of a
  % particle
  % timePassed - time passed
  %
  % Calculates the positon matrix of all point particles given inMatrix and
  % timePassed by following the using the force vectors of all particles 
  % in vectorized form to compute displacements
  % F = G * dot((dot(m_1, m_2)/r^2) r^2)
  G =  6.67384e-11; % gravitational constant
  currentPositionMatrix = inMatrix(1:end, 1:3); %
  massMatrix = transpose(inMatrix(1:end, 4));
  radiiSquared = computeRadiiSquaredMatrix(currentPositionMatrix);
%   radUnitVecs = computeUnitVecMatrix(currentPositionMatrix);
%   forceVecs = computeForces(currentPositionMatrix, massMatrix, radiiSquared, radUnitVecs);
%   newPositionMatrix = forceVecs  * power(massMatrix, -1) ; 
  
end
  
