#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[])
{
  if(argc < 2){
    fprintf(2, "Error\n");
    exit(-1);
  }
  // 提取时长 
  sleep(atoi(argv[1]));
  // 退出进程
  exit(0);
  return 0;
}
