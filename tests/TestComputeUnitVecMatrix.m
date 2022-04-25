classdef TestComputeUnitVecMatrix < matlab.unittest.TestCase
  methods(Test)

    % complex test case - should succeed
    function passComplex(testCase)
      in = [1,     2,     3;
            4,     5,     6;
            4,     3,     2];
      
      raw = computeUnitVecMatrix(in);
      out = round(raw, 4);
      testCase.verifyEqual(out(:,:,1,1), [0     0     0]);
      
      testCase.verifyEqual(out(:,:,2,1), [-0.5774   -0.5774   -0.5774]);
      
      testCase.verifyEqual(out(:,:,3,1), [-0.9045   -0.3015    0.3015]);
      
      testCase.verifyEqual(out(:,:,1,2), [0.5774    0.5774    0.5774]);
      
      
      testCase.verifyEqual(out(:,:,2,2), [0     0     0]);
      
      
      testCase.verifyEqual(out(:,:,3,2), [0    0.4472    0.8944]);
      
      
      testCase.verifyEqual(out(:,:,1,3), [0.9045    0.3015   -0.3015]);
      
      
      testCase.verifyEqual(out(:,:,2,3), [0   -0.4472   -0.8944]);
      
      
      testCase.verifyEqual(out(:,:,3,3), [0     0     0]);
    end

  end
end

