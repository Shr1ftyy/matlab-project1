classdef TestProcessVecs < matlab.unittest.TestCase
  methods(Test)
    function passSimple(testCase)
      in = [1, 2, 3, 4];
      out = processVec(in);
      testCase.verifyEqual(in, out);
    end
    function failVectorTooBig(testCase)
      in = [1, 2, 3, 4, 5];
      out = processVec(in);
      testCase.verifyEqual(out, false);
    end
    function failVectorIncorrectInput(testCase)
      in = ["1", 2, 3 "5"];
      out = processVec(in);
      testCase.verifyEqual(out, false);
    end
    function failVectorWeird(testCase)
      in = [1, 2, 3, 4, 5, "134324", true];
      out = processVec(in);
      testCase.verifyEqual(out, false);
    end
  end
end

