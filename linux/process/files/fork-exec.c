#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main ()
{
  pid_t child_pid;
  char* program = "pwd";
  char* arg_list[] = {"pwd", NULL};

  /* Create a child process. */
  child_pid = fork ();
  printf("The fork return is %5d, PID is %5d, PPID is %5d\n", child_pid, getpid(), getppid());

  if (child_pid > 0) {
    /* This is the parent process. Sleep for a minute. */
    sleep (60);
  } else {
    /* This is the child process. Exit immediately. */
    execvp (program, arg_list);
    exit (0);
  }

  return 0;
}

