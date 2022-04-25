classdef TestComputeRadiiSquaredMatrix < matlab.unittest.TestCase
  methods(Test)
    function passSimple(testCase)
      in = [1,     2,     3;
            4,     5,     6;
            7,     8,     9];

      out = computeRadiiSquaredMatrix(in);
      expected = [0    27   108
                  27     0    27
                 108    27     0];
      testCase.verifyEqual(out,expected);
    end
    function passBigUnCertain(testCase)
      in = [1,     2,     3;
            4,     5,     6;
            4,     5,     6;
            45,     11,     23;
            34,     45,     354;
            7,     8,     9];

      out = round(computeRadiiSquaredMatrix(in), 4);

      expected =               [0          27          27        2417      126139         108;
                              27           0           0        2006      123604          27;
                              27           0           0        2006      123604          27;
                            2417        2006        2006           0      110838        1649;
                          126139      123604      123604      110838           0      121123;
                             108          27          27        1649      121123           0];

      testCase.verifyEqual(out,expected);
    end
%     function passUncertain(testCase)
%       in = [1,     2,     3;
%             4,     5,     6;
%             7,     8,     9
%             22,    33,  220];
% 
%       out = round(computeRadiiSquaredMatrix(in), 4);
%       expected = 1.0e+04 * [    0.0027,    0.0108,    4.8491;
%                                 0.0027,    0.0027,    4.6904;
%                                 0.0108,    0.0027,    4.5371;
%                                 4.8491,    4.6904,    4.5371];
% 
%       testCase.verifyEqual(out,expected);
%     end
  end
end

