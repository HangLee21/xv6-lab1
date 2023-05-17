#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/param.h"
#include "kernel/fs.h"

int main(int argc, char* argv[]){
  char buf[32];
  char *args[32];
  char prevArg[32];
  char* ptr = buf;
  int j = 0;
  for(int i = 1; i < argc; i++){
    args[j++] = argv[i];
  }
  int k, idx = 0;
  while((k = read(0, prevArg, sizeof(prevArg))) >  0){
    for(int i = 0 ; i < k; i++){
      // 换行符
      if(prevArg[i] == '\n'){
          buf[idx] = 0;
          idx = 0;
          args[j++] = ptr;
          ptr = buf;
          args[j] = 0;
          j = argc - 1;
          if(fork() == 0){
            exec(argv[1], args);
          }
          wait(0);
      }
      // 分拆参数
      else if(prevArg[i] == ' '){
        buf[idx++] = 0;
        args[j++] = ptr;
        ptr = &buf[idx];
      }
      // 正常参数
      else{
        buf[idx++] = prevArg[i];
      }
    }
  }
  exit(0);
  return 0;
}
