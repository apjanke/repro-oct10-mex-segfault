/* apj_just_getscalar.c MEX file source */
#include <mex.h>
#include <stdio.h>

#pragma STDC FENV_ACCESS ON

void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[] ) {

  int rnd = mxGetScalar(prhs[0]);
  printf("rnd: %d\n", rnd);
}
