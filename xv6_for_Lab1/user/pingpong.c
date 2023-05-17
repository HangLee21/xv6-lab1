#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[])
{
  // 0->read 1->write
  int p1[2], p2[2];
  pipe(p1);
  pipe(p2);
  char c[1];
  int pid = fork();
  // parent
  if(pid > 0){
    close(p1[0]);
    close(p2[1]);
    write(p1[1], " ", 1);
    read(p2[0], c, sizeof c);
    printf("%d: received pong\n",getpid());
    close(p1[1]);
    close(p2[0]);
    exit(0);
  } 
  // child
  else if(pid == 0){
    close(p1[1]);
    close(p2[0]);
    read(p1[0], c, sizeof c);
    printf("%d: received ping\n",getpid());
    write(p2[1], " ", 1);
    close(p1[0]);
    close(p2[1]);
    exit(0);
  } 
  // error
  else {
    printf("fork error\n");
    exit(-1);
  }
  return 0;
}
