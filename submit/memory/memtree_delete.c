/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_delete.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/17 16:25:43 by bhildebr          #+#    #+#             */
/*   Updated: 2024/02/13 15:21:56 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

static t_type	yet_another_helper(t_memtree *memtree)
{
	t_memtree	min_root;
	t_type		min_type;

	if ((*memtree)->ltree == NULL)
	{
		min_root = *memtree;
		min_type = min_root->type;
		*memtree = min_root->rtree;
		free(min_root);
	}
	else
	{
		min_type = yet_another_helper(&((*memtree)->ltree));
	}
	memtree_rebalance(memtree);
	return (min_type);
}

static void	*another_helper(t_memtree *memtree)
{
	t_memtree	min_root;
	void		*min_address;

	if ((*memtree)->ltree == NULL)
	{
		min_root = *memtree;
		min_address = min_root->address;
	}
	else
	{
		min_address = another_helper(&((*memtree)->ltree));
	}
	return (min_address);
}

static void	helper(t_memtree *memtree, void *address)
{
	t_memtree	old_root;

	if (*memtree == NULL)
		return ;
	else if ((*memtree)->address == address)
	{
		if ((*memtree)->rtree != NULL)
		{
			(*memtree)->address = another_helper(&((*memtree)->rtree));
			(*memtree)->type = yet_another_helper(&((*memtree)->rtree));
			free(address);
		}
		else
		{
			old_root = *memtree;
			*memtree = (*memtree)->ltree;
			free(old_root->address);
			free(old_root);
		}
	}
	else if (address < (*memtree)->address)
		helper(&((*memtree)->ltree), address);
	else if (address > (*memtree)->address)
		helper(&((*memtree)->rtree), address);
	memtree_rebalance(memtree);
}

void	memtree_delete(void *address)
{
	t_memtree	*memtree;

	memtree = memtree_get();
	helper(memtree, address);
}
