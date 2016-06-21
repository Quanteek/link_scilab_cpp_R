PKG_CPPFLAGS=`Rscript -e "Rcpp:::CxxFlags()"`
PATH_SCILAB = /Applications/scilab-6.0.0-beta-2.app/Contents/MacOS
SCILAB_CFLAGS = -I$(PATH_SCILAB)/include/scilab
SCILAB_LDFLAGS = -lscilab -lscicall_scilab
PATH_TO_LIB_SCILAB = $(PATH_SCILAB)/lib/scilab
PATH_TO_LIB_CALL_SCILAB = $(PATH_SCILAB)/lib/scilab
PATH_TO_THIRD = $(PATH_SCILAB)/lib/thirdparty
PATH_TO_BLAS = $(PATH_SCILAB)/lib/thirdparty/10.10
DYLD_LIBRARY_PATH=$(PATH_TO_LIB_SCILAB):$(PATH_TO_LIB_CALL_SCILAB):$(PATH_TO_THIRD):$(PATH_TO_BLAS)
export SCI=/Applications/scilab-6.0.0-beta-2.app/Contents/MacOS/share/scilab
#export SCI=/Applications/scilab-6.0.0-beta-2.app/Contents/MacOS/lib/scilab

# R:
# 	R CMD SHLIB hello.cpp
# 	g++ -m32 -I/usr/include/R -L/Users/bayolb/Library/R/3.3/library/Rcpp/lib -lRcpp -Wl,-rpath,/usr/lib/R/library/Rcpp/lib -I/usr/local/include -I/Users/bayolb/Library/R/3.3/library/Rcpp/include  -fpic  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=atom -fasynchronous-unwind-tables -c hello.cpp -o hello.o
# 	g++ -m32 -shared -L/usr/local/lib -o hello.so hello.o -L/Users/bayolb/Library/R/3.3/library/Rcpp/lib -lRcpp -Wl,-rpath,/usr/lib/R/library/Rcpp/lib -L/usr/lib/R/lib -lR

scilab:
	gcc -o scilab $(SCILAB_LDFLAGS) -L$(PATH_TO_LIB_SCILAB) -L$(PATH_TO_LIB_CALL_SCILAB) -L$(PATH_TO_THIRD) -L$(PATH_TO_BLAS) $(SCILAB_CFLAGS) scilab.c
	./scilab
