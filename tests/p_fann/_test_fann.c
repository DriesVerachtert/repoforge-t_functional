/*
Small test program to check if the fann library can be called or not: it just calls some fann functions
Copy pasted together from some examples made by Steffen Nissen at http://leenissen.dk/fann/wp/help/getting-started/ 
*/

#include "fann.h"

int main(int argc, char** argv) {

  fann_type input[2] = {-1, 1};
  struct fann *ann = fann_create_standard(3, 2, 3, 1);
  fann_set_activation_function_hidden(ann, FANN_SIGMOID_SYMMETRIC);
  fann_set_activation_function_output(ann, FANN_SIGMOID_SYMMETRIC);
  fann_type *calc_out = fann_run(ann, input);
  printf ("untested NN returned: %f\n", calc_out[0]);
  return 0;
}
