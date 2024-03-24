/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   memtree.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/15 19:27:24 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/24 20:17:09 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MEMTREE_H
# define MEMTREE_H

# include <stdlib.h>

typedef struct s_type		*t_type;
struct						s_type;

typedef struct s_memtree	*t_memtree;

struct s_memtree {
	t_memtree		ltree;
	t_memtree		rtree;
	void			*address;
	t_type			type;
	int				height;
};

t_memtree	*memtree_get(void);
t_memtree	memtree_create(t_type type, void *address);
void		memtree_destroy(void);
void		memtree_insert(t_type type, void *address);
void		memtree_delete(void *address);
void		memtree_rebalance(t_memtree *memtree);
void		memtree_update_height(t_memtree memtree);
int			memtree_get_height(t_memtree memtree);
t_type		memtree_search(void *address);

#endif