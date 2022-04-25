classdef TestComputeForces < matlab.unittest.TestCase
  methods(Test)
    % should pass
    function passSimple(testCase)
      masses = [10000;20000;20000];
      radiiSqrd =         [0    3.0000   50.0000;
                          3.0000         0   29.0000;
                          50.0000   29.0000         0];
      radUnitVecs = [];
      radUnitVecs(:,:,1,1) = [0     0     0];
      radUnitVecs(:,:,2,1) = [-0.5774   -0.5774   -0.5774];
      radUnitVecs(:,:,3,1) = [-0.4243   -0.5657   -0.7071];
      radUnitVecs(:,:,1,2) = [0.5774    0.5774    0.5774];
      radUnitVecs(:,:,2,2) = [0     0     0];
      radUnitVecs(:,:,3,2) = [-0.3714   -0.5571   -0.7428];
      radUnitVecs(:,:,1,3) = [0.4243    0.5657    0.7071];
      radUnitVecs(:,:,2,3) = [0.3714    0.5571    0.7428];
      radUnitVecs(:,:,3,3) = [0     0     0];

      raw = computeForces(masses, radiiSqrd, radUnitVecs);
      out = round(raw, 4, "decimals");
      expected = [0.0027    0.0027    0.0028;
                  -0.0022   -0.0021   -0.0019;
                  -0.0005   -0.0007   -0.0009];
      
      testCase.verifyEqual(out, expected);

    end
  end
end

