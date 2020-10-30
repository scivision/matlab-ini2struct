classdef TestUnit < matlab.unittest.TestCase

methods (Test)

function test_example(tc)
import matlab.unittest.constraints.IsFile

cwd = fileparts(mfilename('fullpath'));
example = fullfile(cwd, "example.ini");

tc.assumeThat(example, IsFile)

s = ini2struct(example);
tc.verifyClass(s, 'struct')
tc.verifyEqual(s.DATA.keyNum, 113);

end

function test_lint(tc)

tc.verifyEmpty(checkcode("ini2struct.m"))

end

end

end
