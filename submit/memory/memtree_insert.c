/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_insert.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/17 15:35:24 by bhildebr          #+#    #+#             */
/*   Updated: 2024/02/13 15:21:52 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

static void	helper(t_memtree *memtree, t_type type, void *address)
{
	if (*memtree == NULL)
	{
		*memtree = memtree_create(type, address);
	}
	else if (address == (*memtree)->address)
	{
		return ;
	}
	else
	{
		if (address < (*memtree)->address)
		{
			helper(&((*memtree)->ltree), type, address);
		}
		else
		{
			helper(&((*memtree)->rtree), type, address);
		}
		memtree_rebalance(memtree);
	}
}

void	memtree_insert(t_type type, void *address)
{
	t_memtree	*memtree;

	memtree = memtree_get();
	helper(memtree, type, address);
}
