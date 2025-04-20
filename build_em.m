% Build all the mex files

src_files = dir('*.c');
src_files = {src_files.name}'';

for i = 1:numel(src_files)
  src_file = src_files{i};
  fprintf('Building mex: %s\n', src_file);
  mex('--verbose', src_file);
  fprintf('\n\n')
end

fprintf('Built all mex files.\n')
