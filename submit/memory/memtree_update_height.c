/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_update_height.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/18 13:22:15 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/15 19:28:24 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

void	memtree_update_height(t_memtree memtree)
{
	int	lheight;
	int	rheight;

	lheight = memtree_get_height(memtree->ltree);
	rheight = memtree_get_height(memtree->rtree);
	if (lheight > rheight)
	{
		memtree->height = 1 + lheight;
	}
	else
	{
		memtree->height = 1 + rheight;
	}
}
