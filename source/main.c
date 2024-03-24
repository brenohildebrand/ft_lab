/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/21 16:46:49 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/24 20:07:17 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memory.h"
#include <stdio.h>

int	main(void)
{
	void	*ptr;

	ptr = allocate(10);
	printf("%p\n", ptr);
	deallocate(ptr);
}
