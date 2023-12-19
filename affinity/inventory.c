/*
 * Inventory available processors, find the processor type in hybrid setup
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <sys/types.h>
#include <sys/sysinfo.h>
#include <unistd.h>
#include <sched.h>

int main(void){
  int i;
  cpu_set_t set;
  int nprocs = get_nprocs();
  
  CPU_ZERO(&set);
  
  if (sched_getaffinity(getpid(),sizeof(set),&set) == -1){
    fprintf(stderr,"sched_getaffinity fails\n");
    return 0;
  }

  for (i=0;i<nprocs;i++){
    if (CPU_ISSET(i,&set)){
      printf("cpu %d\n",i);
    }
  }
}
  
  
