classdef TestComputeRadiiSquaredMatrix < matlab.unittest.TestCase
  methods(Test)
    function passSimple(testCase)
      in = [1,     2,     3;
            4,     5,     6;
            4,     3,     2];

      out = processVec(in);
      expected = [5.1962; 4.4721];
      testCase.verifyEqual(in,expected);
    end
    function passSimple2(testCase)
      in = [1,     2,     3;
            4,     5,     6;
            4,     5,     6;
            4,     3,     2];

      out = processVec(in);
      expected = [5.1962; 4.4721];
      testCase.verifyEqual(in,expected);
    end
     function failWeird(testCase)
      in = ["1",     2,     3;
            4,     5,     6;
            4,     3,     "2"];
      out = processVec(in);
      expected = [5.1962; 4.4721];
      testCase.verifyError(in);
    end
  end
end

