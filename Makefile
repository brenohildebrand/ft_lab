# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By:  <@student.42.fr>                          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/21 14:44:55 by                   #+#    #+#              #
#    Updated: 2024/02/21 14:44:55 by                  ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = lab

DEBUG_LIBFRAMEWORK = /home/bhildebr/github/ft_framework/build/debug/bin/libframework.a
DEFAULT_LIBFRAMEWORK = /home/bhildebr/github/ft_framework/build/default/bin/libframework.a

DEBUG = ./build/debug/bin/lab
DEFAULT = ./build/default/bin/lab

CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c99 -Dlab=main
CPATHS = \
	-include memtree.h \
	-include any.h \
	-include allocate.h \
	-include assert.h \
	-include deallocate.h \
	-include debug.h \
	-include delete.h \
	-include error.h \
	-include new.h \
	-include print.h \
	-include character.h \
	-include file.h \
	-include fractional.h \
	-include integer.h \
	-include string.h \
	-include vector.h \
	-iquote /home/bhildebr/github/ft_framework/source \
	-iquote /home/bhildebr/github/ft_framework/source/functions \
	-iquote /home/bhildebr/github/ft_framework/source/functions/allocate \
	-iquote /home/bhildebr/github/ft_framework/source/functions/assert \
	-iquote /home/bhildebr/github/ft_framework/source/functions/deallocate \
	-iquote /home/bhildebr/github/ft_framework/source/functions/debug \
	-iquote /home/bhildebr/github/ft_framework/source/functions/delete \
	-iquote /home/bhildebr/github/ft_framework/source/functions/error \
	-iquote /home/bhildebr/github/ft_framework/source/functions/new \
	-iquote /home/bhildebr/github/ft_framework/source/functions/print \
	-iquote /home/bhildebr/github/ft_framework/source/types \
	-iquote /home/bhildebr/github/ft_framework/source/types/any \
	-iquote /home/bhildebr/github/ft_framework/source/types/character \
	-iquote /home/bhildebr/github/ft_framework/source/types/file \
	-iquote /home/bhildebr/github/ft_framework/source/types/fractional \
	-iquote /home/bhildebr/github/ft_framework/source/types/integer \
	-iquote /home/bhildebr/github/ft_framework/source/types/memtree \
	-iquote /home/bhildebr/github/ft_framework/source/types/string \
	-iquote /home/bhildebr/github/ft_framework/source/types/vector \
	-iquote /home/bhildebr/github/ft_lab/source

SOURCES = \
	./source/lab.c

HEADERS = 

OBJECTS = \
	lab.o

DEPENDENCIES = \
	lab.d

DEBUG_DIR = ./build/debug
DEFAULT_DIR = ./build/default

DEBUG_OBJECTS = $(addprefix $(DEBUG_DIR)/objects/, $(OBJECTS))
DEBUG_DEPENDENCIES = $(addprefix $(DEBUG_DIR)/dependencies/, $(DEPENDENCIES))

DEFAULT_OBJECTS = $(addprefix $(DEFAULT_DIR)/objects/, $(OBJECTS))
DEFAULT_DEPENDENCIES = $(addprefix $(DEFAULT_DIR)/dependencies/, $(DEPENDENCIES))

all: build

$(NAME): build

$(DEBUG_LIBFRAMEWORK):
	@make debug -C /home/bhildebr/github/ft_framework

$(DEFAULT_LIBFRAMEWORK):
	@make -C /home/bhildebr/github/ft_framework

debug: $(DEBUG_LIBFRAMEWORK) $(DEBUG)
$(DEBUG): CFLAGS += -DDEBUG -g
$(DEBUG): $(DEBUG_OBJECTS) | $(DEBUG_DIR)
	@$(CC) $(CFLAGS) -o $(DEBUG_DIR)/bin/$(NAME) $(DEBUG_OBJECTS) $(DEBUG_LIBFRAMEWORK)

build: $(DEFAULT_LIBFRAMEWORK) $(DEFAULT)
$(DEFAULT): $(DEFAULT_OBJECTS) | $(DEFAULT_DIR)
	@$(CC) $(CFLAGS) -o $(DEFAULT_DIR)/bin/$(NAME) $(DEFAULT_OBJECTS) $(DEFAULT_LIBFRAMEWORK)

clean:
	@$(RM) $(DEBUG_OBJECTS)
	@$(RM) $(DEBUG_DEPENDENCIES)
	@$(RM) $(DEFAULT_OBJECTS)
	@$(RM) $(DEFAULT_DEPENDENCIES)

fclean: clean
	@$(RM) $(DEBUG_DIR)/bin/$(NAME)
	@$(RM) $(DEFAULT_DIR)/bin/$(NAME)

re: fclean all

.PHONY: all build debug release $(NAME) clean fclean re

-include $(DEBUG_DEPENDENCIES)
-include $(DEFAULT_DEPENDENCIES)

$(DEBUG_DIR)/objects/allocate.o: ./source/functions/allocate/allocate.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/allocate.d -c ./source/functions/allocate/allocate.c -o $(DEBUG_DIR)/objects/allocate.o

$(DEBUG_DIR)/objects/assert.o: ./source/functions/assert/assert.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/assert.d -c ./source/functions/assert/assert.c -o $(DEBUG_DIR)/objects/assert.o

$(DEBUG_DIR)/objects/deallocate.o: ./source/functions/deallocate/deallocate.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/deallocate.d -c ./source/functions/deallocate/deallocate.c -o $(DEBUG_DIR)/objects/deallocate.o

$(DEBUG_DIR)/objects/debug.o: ./source/functions/debug/debug.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/debug.d -c ./source/functions/debug/debug.c -o $(DEBUG_DIR)/objects/debug.o

$(DEBUG_DIR)/objects/delete.o: ./source/functions/delete/delete.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/delete.d -c ./source/functions/delete/delete.c -o $(DEBUG_DIR)/objects/delete.o

$(DEBUG_DIR)/objects/error.o: ./source/functions/error/error.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/error.d -c ./source/functions/error/error.c -o $(DEBUG_DIR)/objects/error.o

$(DEBUG_DIR)/objects/new.o: ./source/functions/new/new.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/new.d -c ./source/functions/new/new.c -o $(DEBUG_DIR)/objects/new.o

$(DEBUG_DIR)/objects/print.o: ./source/functions/print/print.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/print.d -c ./source/functions/print/print.c -o $(DEBUG_DIR)/objects/print.o

$(DEBUG_DIR)/objects/any_create.o: ./source/types/any/any_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/any_create.d -c ./source/types/any/any_create.c -o $(DEBUG_DIR)/objects/any_create.o

$(DEBUG_DIR)/objects/any_destroy.o: ./source/types/any/any_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/any_destroy.d -c ./source/types/any/any_destroy.c -o $(DEBUG_DIR)/objects/any_destroy.o

$(DEBUG_DIR)/objects/character_create.o: ./source/types/character/character_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/character_create.d -c ./source/types/character/character_create.c -o $(DEBUG_DIR)/objects/character_create.o

$(DEBUG_DIR)/objects/character_destroy.o: ./source/types/character/character_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/character_destroy.d -c ./source/types/character/character_destroy.c -o $(DEBUG_DIR)/objects/character_destroy.o

$(DEBUG_DIR)/objects/character_get.o: ./source/types/character/character_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/character_get.d -c ./source/types/character/character_get.c -o $(DEBUG_DIR)/objects/character_get.o

$(DEBUG_DIR)/objects/file_create.o: ./source/types/file/file_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/file_create.d -c ./source/types/file/file_create.c -o $(DEBUG_DIR)/objects/file_create.o

$(DEBUG_DIR)/objects/file_destroy.o: ./source/types/file/file_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/file_destroy.d -c ./source/types/file/file_destroy.c -o $(DEBUG_DIR)/objects/file_destroy.o

$(DEBUG_DIR)/objects/fractional_create.o: ./source/types/fractional/fractional_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/fractional_create.d -c ./source/types/fractional/fractional_create.c -o $(DEBUG_DIR)/objects/fractional_create.o

$(DEBUG_DIR)/objects/fractional_destroy.o: ./source/types/fractional/fractional_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/fractional_destroy.d -c ./source/types/fractional/fractional_destroy.c -o $(DEBUG_DIR)/objects/fractional_destroy.o

$(DEBUG_DIR)/objects/integer_create.o: ./source/types/integer/integer_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/integer_create.d -c ./source/types/integer/integer_create.c -o $(DEBUG_DIR)/objects/integer_create.o

$(DEBUG_DIR)/objects/integer_destroy.o: ./source/types/integer/integer_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/integer_destroy.d -c ./source/types/integer/integer_destroy.c -o $(DEBUG_DIR)/objects/integer_destroy.o

$(DEBUG_DIR)/objects/integer_get.o: ./source/types/integer/integer_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/integer_get.d -c ./source/types/integer/integer_get.c -o $(DEBUG_DIR)/objects/integer_get.o

$(DEBUG_DIR)/objects/memtree_create.o: ./source/types/memtree/memtree_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_create.d -c ./source/types/memtree/memtree_create.c -o $(DEBUG_DIR)/objects/memtree_create.o

$(DEBUG_DIR)/objects/memtree_delete.o: ./source/types/memtree/memtree_delete.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_delete.d -c ./source/types/memtree/memtree_delete.c -o $(DEBUG_DIR)/objects/memtree_delete.o

$(DEBUG_DIR)/objects/memtree_destroy.o: ./source/types/memtree/memtree_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_destroy.d -c ./source/types/memtree/memtree_destroy.c -o $(DEBUG_DIR)/objects/memtree_destroy.o

$(DEBUG_DIR)/objects/memtree_get.o: ./source/types/memtree/memtree_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_get.d -c ./source/types/memtree/memtree_get.c -o $(DEBUG_DIR)/objects/memtree_get.o

$(DEBUG_DIR)/objects/memtree_get_height.o: ./source/types/memtree/memtree_get_height.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_get_height.d -c ./source/types/memtree/memtree_get_height.c -o $(DEBUG_DIR)/objects/memtree_get_height.o

$(DEBUG_DIR)/objects/memtree_insert.o: ./source/types/memtree/memtree_insert.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_insert.d -c ./source/types/memtree/memtree_insert.c -o $(DEBUG_DIR)/objects/memtree_insert.o

$(DEBUG_DIR)/objects/memtree_print.o: ./source/types/memtree/memtree_print.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_print.d -c ./source/types/memtree/memtree_print.c -o $(DEBUG_DIR)/objects/memtree_print.o

$(DEBUG_DIR)/objects/memtree_rebalance.o: ./source/types/memtree/memtree_rebalance.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_rebalance.d -c ./source/types/memtree/memtree_rebalance.c -o $(DEBUG_DIR)/objects/memtree_rebalance.o

$(DEBUG_DIR)/objects/memtree_search.o: ./source/types/memtree/memtree_search.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_search.d -c ./source/types/memtree/memtree_search.c -o $(DEBUG_DIR)/objects/memtree_search.o

$(DEBUG_DIR)/objects/memtree_update_height.o: ./source/types/memtree/memtree_update_height.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/memtree_update_height.d -c ./source/types/memtree/memtree_update_height.c -o $(DEBUG_DIR)/objects/memtree_update_height.o

$(DEBUG_DIR)/objects/string_create.o: ./source/types/string/string_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/string_create.d -c ./source/types/string/string_create.c -o $(DEBUG_DIR)/objects/string_create.o

$(DEBUG_DIR)/objects/string_destroy.o: ./source/types/string/string_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/string_destroy.d -c ./source/types/string/string_destroy.c -o $(DEBUG_DIR)/objects/string_destroy.o

$(DEBUG_DIR)/objects/string_get.o: ./source/types/string/string_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/string_get.d -c ./source/types/string/string_get.c -o $(DEBUG_DIR)/objects/string_get.o

$(DEBUG_DIR)/objects/string_is_int.o: ./source/types/string/string_is_int.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/string_is_int.d -c ./source/types/string/string_is_int.c -o $(DEBUG_DIR)/objects/string_is_int.o

$(DEBUG_DIR)/objects/string_to_integer.o: ./source/types/string/string_to_integer.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/string_to_integer.d -c ./source/types/string/string_to_integer.c -o $(DEBUG_DIR)/objects/string_to_integer.o

$(DEBUG_DIR)/objects/vector_create.o: ./source/types/vector/vector_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_create.d -c ./source/types/vector/vector_create.c -o $(DEBUG_DIR)/objects/vector_create.o

$(DEBUG_DIR)/objects/vector_destroy.o: ./source/types/vector/vector_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_destroy.d -c ./source/types/vector/vector_destroy.c -o $(DEBUG_DIR)/objects/vector_destroy.o

$(DEBUG_DIR)/objects/vector_expand.o: ./source/types/vector/vector_expand.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_expand.d -c ./source/types/vector/vector_expand.c -o $(DEBUG_DIR)/objects/vector_expand.o

$(DEBUG_DIR)/objects/vector_get.o: ./source/types/vector/vector_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_get.d -c ./source/types/vector/vector_get.c -o $(DEBUG_DIR)/objects/vector_get.o

$(DEBUG_DIR)/objects/vector_get_length.o: ./source/types/vector/vector_get_length.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_get_length.d -c ./source/types/vector/vector_get_length.c -o $(DEBUG_DIR)/objects/vector_get_length.o

$(DEBUG_DIR)/objects/vector_pop.o: ./source/types/vector/vector_pop.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_pop.d -c ./source/types/vector/vector_pop.c -o $(DEBUG_DIR)/objects/vector_pop.o

$(DEBUG_DIR)/objects/vector_push.o: ./source/types/vector/vector_push.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_push.d -c ./source/types/vector/vector_push.c -o $(DEBUG_DIR)/objects/vector_push.o

$(DEBUG_DIR)/objects/vector_reverse.o: ./source/types/vector/vector_reverse.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_reverse.d -c ./source/types/vector/vector_reverse.c -o $(DEBUG_DIR)/objects/vector_reverse.o

$(DEBUG_DIR)/objects/vector_set.o: ./source/types/vector/vector_set.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_set.d -c ./source/types/vector/vector_set.c -o $(DEBUG_DIR)/objects/vector_set.o

$(DEBUG_DIR)/objects/vector_shift.o: ./source/types/vector/vector_shift.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_shift.d -c ./source/types/vector/vector_shift.c -o $(DEBUG_DIR)/objects/vector_shift.o

$(DEBUG_DIR)/objects/vector_unshift.o: ./source/types/vector/vector_unshift.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/vector_unshift.d -c ./source/types/vector/vector_unshift.c -o $(DEBUG_DIR)/objects/vector_unshift.o

$(DEBUG_DIR)/objects/lab.o: ./source/lab.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEBUG_DIR)/dependencies/lab.d -c ./source/lab.c -o $(DEBUG_DIR)/objects/lab.o


$(DEFAULT_DIR)/objects/allocate.o: ./source/functions/allocate/allocate.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/allocate.d -c ./source/functions/allocate/allocate.c -o $(DEFAULT_DIR)/objects/allocate.o

$(DEFAULT_DIR)/objects/assert.o: ./source/functions/assert/assert.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/assert.d -c ./source/functions/assert/assert.c -o $(DEFAULT_DIR)/objects/assert.o

$(DEFAULT_DIR)/objects/deallocate.o: ./source/functions/deallocate/deallocate.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/deallocate.d -c ./source/functions/deallocate/deallocate.c -o $(DEFAULT_DIR)/objects/deallocate.o

$(DEFAULT_DIR)/objects/debug.o: ./source/functions/debug/debug.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/debug.d -c ./source/functions/debug/debug.c -o $(DEFAULT_DIR)/objects/debug.o

$(DEFAULT_DIR)/objects/delete.o: ./source/functions/delete/delete.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/delete.d -c ./source/functions/delete/delete.c -o $(DEFAULT_DIR)/objects/delete.o

$(DEFAULT_DIR)/objects/error.o: ./source/functions/error/error.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/error.d -c ./source/functions/error/error.c -o $(DEFAULT_DIR)/objects/error.o

$(DEFAULT_DIR)/objects/new.o: ./source/functions/new/new.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/new.d -c ./source/functions/new/new.c -o $(DEFAULT_DIR)/objects/new.o

$(DEFAULT_DIR)/objects/print.o: ./source/functions/print/print.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/print.d -c ./source/functions/print/print.c -o $(DEFAULT_DIR)/objects/print.o

$(DEFAULT_DIR)/objects/any_create.o: ./source/types/any/any_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/any_create.d -c ./source/types/any/any_create.c -o $(DEFAULT_DIR)/objects/any_create.o

$(DEFAULT_DIR)/objects/any_destroy.o: ./source/types/any/any_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/any_destroy.d -c ./source/types/any/any_destroy.c -o $(DEFAULT_DIR)/objects/any_destroy.o

$(DEFAULT_DIR)/objects/character_create.o: ./source/types/character/character_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/character_create.d -c ./source/types/character/character_create.c -o $(DEFAULT_DIR)/objects/character_create.o

$(DEFAULT_DIR)/objects/character_destroy.o: ./source/types/character/character_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/character_destroy.d -c ./source/types/character/character_destroy.c -o $(DEFAULT_DIR)/objects/character_destroy.o

$(DEFAULT_DIR)/objects/character_get.o: ./source/types/character/character_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/character_get.d -c ./source/types/character/character_get.c -o $(DEFAULT_DIR)/objects/character_get.o

$(DEFAULT_DIR)/objects/file_create.o: ./source/types/file/file_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/file_create.d -c ./source/types/file/file_create.c -o $(DEFAULT_DIR)/objects/file_create.o

$(DEFAULT_DIR)/objects/file_destroy.o: ./source/types/file/file_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/file_destroy.d -c ./source/types/file/file_destroy.c -o $(DEFAULT_DIR)/objects/file_destroy.o

$(DEFAULT_DIR)/objects/fractional_create.o: ./source/types/fractional/fractional_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/fractional_create.d -c ./source/types/fractional/fractional_create.c -o $(DEFAULT_DIR)/objects/fractional_create.o

$(DEFAULT_DIR)/objects/fractional_destroy.o: ./source/types/fractional/fractional_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/fractional_destroy.d -c ./source/types/fractional/fractional_destroy.c -o $(DEFAULT_DIR)/objects/fractional_destroy.o

$(DEFAULT_DIR)/objects/integer_create.o: ./source/types/integer/integer_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/integer_create.d -c ./source/types/integer/integer_create.c -o $(DEFAULT_DIR)/objects/integer_create.o

$(DEFAULT_DIR)/objects/integer_destroy.o: ./source/types/integer/integer_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/integer_destroy.d -c ./source/types/integer/integer_destroy.c -o $(DEFAULT_DIR)/objects/integer_destroy.o

$(DEFAULT_DIR)/objects/integer_get.o: ./source/types/integer/integer_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/integer_get.d -c ./source/types/integer/integer_get.c -o $(DEFAULT_DIR)/objects/integer_get.o

$(DEFAULT_DIR)/objects/memtree_create.o: ./source/types/memtree/memtree_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_create.d -c ./source/types/memtree/memtree_create.c -o $(DEFAULT_DIR)/objects/memtree_create.o

$(DEFAULT_DIR)/objects/memtree_delete.o: ./source/types/memtree/memtree_delete.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_delete.d -c ./source/types/memtree/memtree_delete.c -o $(DEFAULT_DIR)/objects/memtree_delete.o

$(DEFAULT_DIR)/objects/memtree_destroy.o: ./source/types/memtree/memtree_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_destroy.d -c ./source/types/memtree/memtree_destroy.c -o $(DEFAULT_DIR)/objects/memtree_destroy.o

$(DEFAULT_DIR)/objects/memtree_get.o: ./source/types/memtree/memtree_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_get.d -c ./source/types/memtree/memtree_get.c -o $(DEFAULT_DIR)/objects/memtree_get.o

$(DEFAULT_DIR)/objects/memtree_get_height.o: ./source/types/memtree/memtree_get_height.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_get_height.d -c ./source/types/memtree/memtree_get_height.c -o $(DEFAULT_DIR)/objects/memtree_get_height.o

$(DEFAULT_DIR)/objects/memtree_insert.o: ./source/types/memtree/memtree_insert.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_insert.d -c ./source/types/memtree/memtree_insert.c -o $(DEFAULT_DIR)/objects/memtree_insert.o

$(DEFAULT_DIR)/objects/memtree_print.o: ./source/types/memtree/memtree_print.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_print.d -c ./source/types/memtree/memtree_print.c -o $(DEFAULT_DIR)/objects/memtree_print.o

$(DEFAULT_DIR)/objects/memtree_rebalance.o: ./source/types/memtree/memtree_rebalance.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_rebalance.d -c ./source/types/memtree/memtree_rebalance.c -o $(DEFAULT_DIR)/objects/memtree_rebalance.o

$(DEFAULT_DIR)/objects/memtree_search.o: ./source/types/memtree/memtree_search.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_search.d -c ./source/types/memtree/memtree_search.c -o $(DEFAULT_DIR)/objects/memtree_search.o

$(DEFAULT_DIR)/objects/memtree_update_height.o: ./source/types/memtree/memtree_update_height.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/memtree_update_height.d -c ./source/types/memtree/memtree_update_height.c -o $(DEFAULT_DIR)/objects/memtree_update_height.o

$(DEFAULT_DIR)/objects/string_create.o: ./source/types/string/string_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/string_create.d -c ./source/types/string/string_create.c -o $(DEFAULT_DIR)/objects/string_create.o

$(DEFAULT_DIR)/objects/string_destroy.o: ./source/types/string/string_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/string_destroy.d -c ./source/types/string/string_destroy.c -o $(DEFAULT_DIR)/objects/string_destroy.o

$(DEFAULT_DIR)/objects/string_get.o: ./source/types/string/string_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/string_get.d -c ./source/types/string/string_get.c -o $(DEFAULT_DIR)/objects/string_get.o

$(DEFAULT_DIR)/objects/string_is_int.o: ./source/types/string/string_is_int.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/string_is_int.d -c ./source/types/string/string_is_int.c -o $(DEFAULT_DIR)/objects/string_is_int.o

$(DEFAULT_DIR)/objects/string_to_integer.o: ./source/types/string/string_to_integer.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/string_to_integer.d -c ./source/types/string/string_to_integer.c -o $(DEFAULT_DIR)/objects/string_to_integer.o

$(DEFAULT_DIR)/objects/vector_create.o: ./source/types/vector/vector_create.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_create.d -c ./source/types/vector/vector_create.c -o $(DEFAULT_DIR)/objects/vector_create.o

$(DEFAULT_DIR)/objects/vector_destroy.o: ./source/types/vector/vector_destroy.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_destroy.d -c ./source/types/vector/vector_destroy.c -o $(DEFAULT_DIR)/objects/vector_destroy.o

$(DEFAULT_DIR)/objects/vector_expand.o: ./source/types/vector/vector_expand.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_expand.d -c ./source/types/vector/vector_expand.c -o $(DEFAULT_DIR)/objects/vector_expand.o

$(DEFAULT_DIR)/objects/vector_get.o: ./source/types/vector/vector_get.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_get.d -c ./source/types/vector/vector_get.c -o $(DEFAULT_DIR)/objects/vector_get.o

$(DEFAULT_DIR)/objects/vector_get_length.o: ./source/types/vector/vector_get_length.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_get_length.d -c ./source/types/vector/vector_get_length.c -o $(DEFAULT_DIR)/objects/vector_get_length.o

$(DEFAULT_DIR)/objects/vector_pop.o: ./source/types/vector/vector_pop.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_pop.d -c ./source/types/vector/vector_pop.c -o $(DEFAULT_DIR)/objects/vector_pop.o

$(DEFAULT_DIR)/objects/vector_push.o: ./source/types/vector/vector_push.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_push.d -c ./source/types/vector/vector_push.c -o $(DEFAULT_DIR)/objects/vector_push.o

$(DEFAULT_DIR)/objects/vector_reverse.o: ./source/types/vector/vector_reverse.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_reverse.d -c ./source/types/vector/vector_reverse.c -o $(DEFAULT_DIR)/objects/vector_reverse.o

$(DEFAULT_DIR)/objects/vector_set.o: ./source/types/vector/vector_set.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_set.d -c ./source/types/vector/vector_set.c -o $(DEFAULT_DIR)/objects/vector_set.o

$(DEFAULT_DIR)/objects/vector_shift.o: ./source/types/vector/vector_shift.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_shift.d -c ./source/types/vector/vector_shift.c -o $(DEFAULT_DIR)/objects/vector_shift.o

$(DEFAULT_DIR)/objects/vector_unshift.o: ./source/types/vector/vector_unshift.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/vector_unshift.d -c ./source/types/vector/vector_unshift.c -o $(DEFAULT_DIR)/objects/vector_unshift.o

$(DEFAULT_DIR)/objects/lab.o: ./source/lab.c
	@$(CC) $(CFLAGS) $(CPATHS) -MMD -MF $(DEFAULT_DIR)/dependencies/lab.d -c ./source/lab.c -o $(DEFAULT_DIR)/objects/lab.o


