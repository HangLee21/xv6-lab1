#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void findPrime(int *p1){
  int p2[2];
  int num;
  close(p1[1]);
  int numSize = read(p1[0], &num, sizeof(int));
  if(numSize == 0){
    exit(0);
  }

  pipe(p2);
  int pid=fork();
  if(pid == 0){
    findPrime(p2);
  }
  else{
    printf("prime %d\n", num);
    close(p2[0]);
    int modNum = num;
    while(read(p1[0], &num, sizeof(int)) != 0){
      // 筛法查找质数
      if(num % modNum != 0){
        write(p2[1], &num, sizeof(int));
      }
    }
    close(p1[0]);
    close(p2[1]);
    wait(0);
    exit(0);
  } 
}

int main(int argc, char*argv[])
{
  int p[2];
  pipe(p);
  int pid=fork();
  if(pid == 0){
    findPrime(p);
  }
  else if(pid > 0){
    close(p[0]);
    for(int i = 2; i <= 35; i++){
      write(p[1], &i, sizeof(int));
    }
    close(p[1]);
    wait(0);
    exit(0);
  }
  else{
    printf("fork error\n");
    exit(-1);
  }
  return 0;
}
