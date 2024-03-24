/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   allocate.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/09 22:47:06 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/24 20:29:20 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

/**
 * Allocates a block of memory of given size and initializes it to zero.
 * 
 * @param size The size in bytes of the memory block to allocate.
 * @return A pointer to the allocated memory block.
 */
void	*allocate(unsigned int size)
{
	void			*address;
	unsigned int	i;

	address = malloc(size);
	if (address == NULL)
	{
		memtree_destroy();
		exit(1);
	}
	i = 0;
	while (i < size)
	{
		((unsigned char *)address)[i] = 0;
		i++;
	}
	memtree_insert(NULL, address);
	return (address);
}
