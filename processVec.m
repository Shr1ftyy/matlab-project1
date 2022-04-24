function outVec = processVec(inVec)
  try
    isnumeric(inVec);
    assert(class(inVec) == "double");
    dimensions = size(inVec);
    assert(length(dimensions) == 2);
    assert(dimensions(1) == 1);
    assert(dimensions(2) == 4);
    outVec = inVec;
  catch b
    warning("Input vector must be a row vector of size 4, try again");
    outVec = false;
  end
end