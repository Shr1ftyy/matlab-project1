function inVec = processVec(inVec)
  try
    isnumeric(inVec);
    dimensions = size(inVec);
    assert(length(dimensions) == 2);
    assert(dimensions(1) == 1);
    assert(dimensions(2) == 4);
  catch b % The error is caught, 
    warning("The vector must be a row vector of length 4 with numbers, try again:");
  end
end