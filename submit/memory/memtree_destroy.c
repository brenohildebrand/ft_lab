/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_destroy.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/17 14:56:09 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/15 19:28:10 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

static void	helper(t_memtree memtree)
{
	if (memtree == NULL)
		return ;
	helper(memtree->ltree);
	helper(memtree->rtree);
	free(memtree->address);
	free(memtree);
}

void	memtree_destroy(void)
{
	t_memtree	*memtree;

	memtree = memtree_get();
	helper(*memtree);
}
