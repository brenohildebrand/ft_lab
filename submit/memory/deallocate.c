/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   deallocate.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/09 22:52:44 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/24 20:10:19 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "memtree.h"

/**
 * Deallocates the memory at the given address by removing its entry
 * from the memory tree.
 *
 * @param address The address of the memory to deallocate.
 */
void deallocate(void *address)
{
	memtree_delete(address);
}
