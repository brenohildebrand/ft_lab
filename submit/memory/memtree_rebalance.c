/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_rebalance.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/17 20:30:07 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/15 19:28:20 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

static void	left_rotate(t_memtree *memtree)
{
	t_memtree	y;
	t_memtree	x;
	t_memtree	b;

	y = *memtree;
	x = y->rtree;
	b = x->ltree;
	y->rtree = b;
	x->ltree = y;
	*memtree = x;
	memtree_update_height((*memtree)->ltree);
	memtree_update_height(*memtree);
}

static void	right_rotate(t_memtree *memtree)
{
	t_memtree	y;
	t_memtree	x;
	t_memtree	b;

	y = *memtree;
	x = y->ltree;
	b = x->rtree;
	y->ltree = b;
	x->rtree = y;
	*memtree = x;
	memtree_update_height((*memtree)->rtree);
	memtree_update_height(*memtree);
}

static void	rebalance_left(t_memtree *memtree)
{
	int	lgrandheight;
	int	rgrandheight;

	lgrandheight = memtree_get_height((*memtree)->ltree->ltree);
	rgrandheight = memtree_get_height((*memtree)->ltree->rtree);
	if (lgrandheight >= rgrandheight)
	{
		right_rotate(memtree);
	}
	else
	{
		left_rotate(&((*memtree)->ltree));
		right_rotate(memtree);
	}
}

static void	rebalance_right(t_memtree *memtree)
{
	int	lgrandheight;
	int	rgrandheight;

	lgrandheight = memtree_get_height((*memtree)->rtree->ltree);
	rgrandheight = memtree_get_height((*memtree)->rtree->rtree);
	if (rgrandheight >= lgrandheight)
	{
		left_rotate(memtree);
	}
	else
	{
		right_rotate(&((*memtree)->rtree));
		left_rotate(memtree);
	}
}

void	memtree_rebalance(t_memtree *memtree)
{
	int	lheight;
	int	rheight;

	if ((*memtree) == NULL)
		return ;
	lheight = memtree_get_height((*memtree)->ltree);
	rheight = memtree_get_height((*memtree)->rtree);
	if (lheight - rheight > 1)
		rebalance_left(memtree);
	else if (rheight - lheight > 1)
		rebalance_right(memtree);
	memtree_update_height(*memtree);
}
