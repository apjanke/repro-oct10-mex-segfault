function test_calls(mex_name, iters)
% Test calling the MEX with various args to try to get a segfault

if nargin < 1 || isempty(mex_name);  mex_name = 'siko_mex_1'; end
if nargin < 2 || isempty(iters);     iters = 1; end

some_arg_vals = {
  0, 1, 2, -1, -2, 0.123, 1.234, [], [0 1 2], ...
  single(2), single(2.345), ...
  int32(0), int32(1), int32(-1), int32(420), ...
  int8(0), int8(1), int8(-1), int8(42), ...
  'foo', 'bar', {'foo' 'bar' 'baz'}, ...
  420.69
};
some_arg_vals = some_arg_vals(:)';

fcn = str2func(mex_name);

say('Calling %s with various args, %d iters each...', mex_name, iters)
for i_arg = 1:numel(some_arg_vals)
  arg = some_arg_vals{i_arg};
  say('calling %s(%s):', mex_name, my_mat2str(arg));
  reported_exception = false;
  for i = 1:iters
    try
      fcn(arg);
    catch err
      % exceptions are fine; we're only worried about segfaults here
      if ~reported_exception
        say('caught exception: %s', err.message)
        reported_exception = true;
      end
    end
  end
end
say('Done.')

end

function say(fmt, varargin)
fmt2 = [fmt '\n'];
  % Use stderr for unbuffered output
fprintf(2, fmt2, varargin{:});
end

function out = my_mat2str(x)
% Because Octave mat2str doesn't support chars?
if ischar(x)
  % not robust but close enough for our purposes here
  out = sprintf("'%s'", x);
elseif iscell(x)
  bits = cell(size(x));
  for i = 1:numel(x)
    bits{i} = my_mat2str(x{i});
  end
  % wrong for non-rowvec cells, but who cares
  out = sprintf('{%s}', strjoin(bits, ', '));
else
  out = mat2str(x);
end
end
