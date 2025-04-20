# repro-oct10-mex-segfault

Repro attempt for segfault in Octave 10.1 with simple mexfiles, per Octave Discourse

This is for debugging the segfault reported by siko1056 [starting here](https://octave.discourse.group/t/add-library-liboctmex-for-mex-interface-c-api/5732/51?u=apjanke) in 2025-04 in the ["Add library liboctmex for MEX interface" thread](https://octave.discourse.group/t/add-library-liboctmex-for-mex-interface-c-api/5732) on the [Octave Discourse](https://octave.discourse.group/).

This is not production quality code. It's just for messing around with a particular bug.

## To use

Build these *.c files in to MEX files with `mex <file.c>` in Octave 10.1, call them with various arguments, and see if they segfault.

`siko_mex_1` segfaulting if called with no arguments is expected, because it's not checking the argin count before dereferencing the first input arg.

## License

GNU GPL v3 or later. (At least for my code. The code I copied from comments in the Discourse thread didn't have an explicit license grant, but I'm assuming GPL3 because that's what most Octave stuff uses. -apj)

## Author

Andrew Janke (<https://github.com/apjanke>) and other commenters on the Discourse thread.

This repo's home is <https://github.com/apjanke/repro-oct10-mex-segfault>.

