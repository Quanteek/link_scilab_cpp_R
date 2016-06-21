#include <stdio.h> /* stderr */

#include "api_scilab.h" /* Provide functions to access to the memory of Scilab */
#include "call_scilab.h" /* Provide functions to call Scilab engine */

// Filename: simple_call_scilab.c

int main(void)
{
    /****** INITIALIZATION **********/
    if ( StartScilab(getenv("SCI"),NULL,NULL) == FALSE )
        {
            fprintf(stderr,"Error while calling StartScilab\n");
            return -1;
        }

    /****** ACTUAL Scilab TASKS *******/
    SendScilabJob("exec('./ishigami.sce', -1);");
    SendScilabJob("ishigami(1,2,3,4)");

    /****** TERMINATION **********/
    if ( TerminateScilab(NULL) == FALSE ) {
        fprintf(stderr,"Error while calling TerminateScilab\n");
        return -2;
    }
    return 0;
}
