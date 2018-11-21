# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: femaury <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/18 20:03:09 by femaury           #+#    #+#              #
#    Updated: 2018/11/21 13:08:51 by femaury          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
SRC_PATH = srcs
SRC_NAME = ft_atoi.c ft_bzero.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
		   ft_isdigit.c ft_isprint.c ft_memalloc.c ft_memccpy.c ft_memchr.c \
		   ft_memcmp.c ft_memcpy.c ft_memdel.c ft_memmove.c ft_memset.c \
		   ft_putchar.c ft_putchar_fd.c ft_putendl.c ft_putendl_fd.c \
		   ft_putnbr.c ft_putnbr_fd.c ft_putstr.c ft_putstr_fd.c ft_strcat.c \
		   ft_strchr.c ft_strclr.c ft_strcmp.c ft_strcpy.c ft_strdel.c \
		   ft_strdup.c ft_strequ.c ft_striter.c ft_striteri.c ft_strjoin.c \
		   ft_strlcat.c ft_strlen.c ft_strmap.c ft_strmapi.c ft_strncat.c \
		   ft_strncmp.c ft_strnequ.c ft_strnew.c ft_strnstr.c ft_strrchr.c \
		   ft_strsplit.c ft_strstr.c ft_strsub.c ft_strtrim.c ft_tolower.c \
		   ft_toupper.c ft_itoa.c ft_strncpy.c ft_lstprepend.c ft_lstdel.c \
		   ft_lstdellast.c ft_lstiter.c ft_lstmap.c ft_lstnew.c ft_lstsize.c \
		   ft_lstrev.c ft_lstfind_content.c ft_lstfind_size.c ft_itoa_base.c \
		   ft_putlst.c ft_strtablen.c ft_strtablen_at.c ft_sqrt.c ft_abs.c\
		   ft_strndup.c ft_strnjoin.c ft_strnclr.c ft_uimaxtoa_base.c \
		   ft_isupper.c ft_islower.c ft_setupcase.c ft_setlowcase.c \
		   ft_imaxtoa_base.c ft_wcharlen.c ft_wstrlen.c ft_strhasc.c ft_gnl.c \
		   ft_strisonly.c ft_pow.c ft_tabdel.c ft_strisonlyc.c ft_strdupto.c \
		   ft_strtabsize.c ft_lstappend.c ft_lstdelfirst.c ft_lstcpy.c \
		   ft_strjoin_split.c ft_strisdigit.c ft_strchrrev.c ft_stratcmp.c \
		   ft_revbits.c ft_strcpyto.c ft_strcatto.c ft_iswhite.c \
		   ft_striswhiteuntil.c ft_splitwhite.c ft_strcountc.c ft_skipnwhite.c \
		   ft_strstrip.c ft_rev2bits.c ft_strclrfrom.c
OBJ_PATH = objs
OBJ_NAME = $(SRC_NAME:.c=.o)
INC_PATH = incs
INC_NAME = libft.h ft_gnl.h
SRC = $(addprefix $(SRC_PATH)/,$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))
INC = $(addprefix $(INC_PATH)/,$(INC_NAME))
CC = gcc
CFLAGS = -Wall -Wextra -Werror -I$(INC_PATH)

T := $(words $(SRC_NAME))
N := x
C = $(words $N)$(eval N := x $N)
ECHO = echo "\r[\033[33m`expr $C '*' 100 / $T`%\033[0m] \
	   Compiling \033[35mlibft\033[0m...\c"

.PHONY: all, clean, fclean, re

all:
	@$(MAKE) $(NAME)
	@$(MAKE) -C ft_printf/
	@$(MAKE) -C ft_dprintf/

$(NAME): $(OBJ)
	@ar rc $@ $^
	@ranlib $@
	@echo "\r[\033[32m100%\033[0m] \033[35m$(NAME)\033[0m is ready! "

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c $(INC)
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -o $@ -c $<
	@$(ECHO)

clean:
ifeq ($(MAKECMDGOALS), clean)
	@$(RM) $(OBJ)
	@rmdir $(OBJ_PATH) 2> /dev/null || true
	@$(MAKE) -C ft_printf/ clean
	@$(MAKE) -C ft_dprintf/ clean
	@echo "[\033[32mOK\033[0m] $(NAME) objects cleaned."
else
	@$(RM) $(OBJ)
	@rmdir $(OBJ_PATH) 2> /dev/null | true
	@echo "[\033[32mOK\033[0m] $(NAME) objects cleaned."
endif

fclean: clean
	@$(RM) $(NAME)
	@$(MAKE) -C ft_printf/ fclean
	@$(MAKE) -C ft_dprintf/ fclean
	@echo "[\033[32mOK\033[0m] $(NAME) \033[31mhas been removed.\033[0m"

re: fclean all
