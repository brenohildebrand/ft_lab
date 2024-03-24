/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree_print.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/11 20:16:59 by bhildebr          #+#    #+#             */
/*   Updated: 2024/02/13 15:38:15 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// #include "memtree.h"
// #include <stdio.h>

// static void	helper(t_memtree memtree)
// {
// 	if (memtree == NULL)
// 		return ;
// 	if (memtree->ltree != NULL)
// 		helper(memtree->ltree);
// 	if (memtree->type)
// 		printf("address: %p\t\t - \ttype: %s\n",
// 				memtree->address, memtree->type->name);
// 	else
// 		printf("address: %p\t\t - \ttype: %s\n",
// 				memtree->address, "allocated");
// 	if (memtree->rtree != NULL)
// 		helper(memtree->rtree);	
// }
// void	memtree_print(void)
// {
// 	t_memtree	*memtree;
// 	memtree = memtree_get();
// 	printf("[memtree]\n");
// 	helper(*memtree);
// 	print("\n");
// }
