/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_search.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/19 09:31:41 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/15 19:28:22 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

static t_type	helper(t_memtree memtree, void *address)
{
	if (memtree->address == address)
		return (memtree->type);
	else if (address < memtree->address)
		return (helper(memtree->ltree, address));
	else if (address > memtree->address)
		return (helper(memtree->rtree, address));
	return (NULL);
}

t_type	memtree_search(void *address)
{
	t_memtree	*memtree;

	memtree = memtree_get();
	return (helper(*memtree, address));
}
