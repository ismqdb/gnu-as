#include <stdio.h>

long squareme(long x){
    return x*x;
}

int main(){
    long myval;
    fprintf(stdout, "Enter a number:");
    fscanf(stdin, "%d", &myval);
    fprintf(stdout, "The square of %d is %d.\n", myval, squareme(myval));
}