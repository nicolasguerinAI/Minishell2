/*
** signal_process.c for signal_process in /home/nicolas/Epitech/Shell/PSU_2016_minishell2/src/signal
** 
** Made by Nicolas
** Login   <nicolas.guerin@epitech.eu>
** 
** Started on  Wed Apr  5 00:09:38 2017 Nicolas
** Last update Wed Apr  5 03:57:07 2017 Nicolas
*/

#include "prototypes.h"

void	signal_process()
{
  if (signal(SIGINT, &get_sigint) == SIG_ERR)
    my_putstr("ERROR_SIGNAL\n", 2, RED);
  if (signal(SIGSEGV, &get_sigseg) == SIG_ERR)
    my_putstr("ERROR_SIGNAL\n", 2, RED);
  if (signal(SIGABRT, &get_sigabrt) == SIG_ERR)
    my_putstr("ERROR_SIGNAL\n", 2, RED);
}