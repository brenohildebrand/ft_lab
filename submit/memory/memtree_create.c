/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_create.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/17 13:34:02 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/15 19:27:58 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

t_memtree memtree_create(t_type type, void *address)
{
	t_memtree memtree;

	memtree = malloc(sizeof(struct s_memtree));
	if (memtree == NULL)
	{
		memtree_destroy();
		return (NULL);
	}
	memtree->height = 1;
	memtree->ltree = NULL;
	memtree->rtree = NULL;
	memtree->address = address;
	memtree->type = type;
	return (memtree);
}
