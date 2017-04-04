##
## Makefile for makefile in /home/nicolas/Epitech/Shell/PSU_2016_minishell2
## 
## Made by Nicolas
## Login   <nicolas.guerin@epitech.eu>
## 
## Started on  Wed Apr  5 01:04:14 2017 Nicolas
## Last update Wed Apr  5 01:19:09 2017 Nicolas
##

NAME	= my_sh

CC	= gcc

RM	= rm -f

SRCS	= ./src/builtin/builtin.c	\
	  ./src/builtin/my_cd.c		\
	  ./src/builtin/my_env.c	\
	  ./src/builtin/my_setenv.c	\
	  ./src/builtin/my_unsetenv.c	\
	  ./src/execve/find_if_exist.c	\
	  ./src/execve/my_exec.c	\
	  ./src/execve/my_exec_brut.c	\
	  ./src/fct/count_word.c	\
	  ./src/fct/free_tab.c		\
	  ./src/fct/get_next_line.c	\
	  ./src/fct/my_memcmp.c		\
	  ./src/fct/my_putchar.c	\
	  ./src/fct/my_putstr.c		\
	  ./src/fct/my_realloc.c	\
	  ./src/fct/my_str_to_wordtab.c	\
	  ./src/fct/my_strcat.c		\
	  ./src/fct/my_strcpy.c		\
	  ./src/fct/my_strdup.c		\
	  ./src/fct/my_strlen.c		\
	  ./src/fct/my_strlen_tab.c	\
	  ./src/fct/my_strncmp.c	\
	  ./src/fct/show_tab.c		\
	  ./src/main.c			\
	  ./src/signal/get_sigint.c	\
	  ./src/signal/get_sigseg.c	\
	  ./src/signal/signal_process.c 

OBJS	= $(SRCS:.c=.o)

CFLAGS = -I ./include/
CFLAGS += -W -Wall -Wextra

all: $(NAME)

$(NAME): $(OBJS)
	 $(CC) $(OBJS) -o $(NAME) $(LDFLAGS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
