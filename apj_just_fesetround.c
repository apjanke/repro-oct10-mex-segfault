/* apj_just_fesetround.c MEX file source */

#include <mex.h>
#include <fenv.h>
#include <float.h>

#pragma STDC FENV_ACCESS ON

void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[] ) {

  int mode = FE_DOWNWARD;
  int err = fesetround (mode);
}
