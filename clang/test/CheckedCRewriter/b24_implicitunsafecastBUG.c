// RUN: cconv-standalone %s -- | FileCheck -match-full-lines %s

int *sus(int *x, int*y) {
  int *z = malloc(sizeof(int));
  *z = 1;
  x++;
  *x = 2;
  return z;
}
//CHECK: int *sus(int *x, _Ptr<int> y) : itype(_Ptr<int>) {

int* foo() {
  int sx = 3, sy = 4, *x = &sx, *y = &sy;
  int *z = (int *) sus(x, y);
  *z = *z + 1;
  return z;
}
//CHECK: _Ptr<int> foo(void) {

char* bar() {
  int sx = 3, sy = 4, *x = &sx, *y = &sy;
  // This will make sus return value WILD. 
  // Because, sus returns int* but assigning to char *
  char *z = sus(x, y);
  return z;
}
//CHECK: char* bar() {
