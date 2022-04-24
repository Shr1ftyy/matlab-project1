import matlab.unittest.TestSuite
addpath(".") % adds root directory to search path (makes loading scripts for testing easier)
suiteFolder = TestSuite.fromFolder("./tests");
result = run(suiteFolder);