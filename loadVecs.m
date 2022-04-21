function loadedVecs = loadVecs(nBodies)
  assert(isnumeric(nBodies));
  assert(length(nBodies) == 1); % make
  loadedVecs = [];
  i = 1;
  while i<=nBodies 
      fprintf("Insert vector in form [x, y, z, mass] in SI units for particle %0.0f (P%0.0f):\n", i, i);
      inputVec = input("");
      processedVec = processVec(inputVec);
      loadedVecs = [loadedVecs; processedVec];
      i = i + 1;
  end
end