// RUN: cconv-standalone %s -- | FileCheck -match-full-lines %s

/*what we're interested in*/ 
extern int *x; 
//CHECK: extern int *x; 

/*safe filler to ensure that conversion happens*/ 
void g(int *y) { 
	*y = 2;
}
//CHECK: void g(_Ptr<int> y) { 

