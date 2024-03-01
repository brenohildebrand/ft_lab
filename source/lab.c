/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lab.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhildebr <bhildebr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/21 12:13:29 by bhildebr          #+#    #+#             */
/*   Updated: 2024/03/01 16:59:27 by bhildebr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

t_i32	main(/* copy from ft_name */)
{
	framework_setup();
	push_swap(args);
	framework_teardown();
}

int	lab(void)
{
	framework_init();
	framework_destroy();
	loopinrange(42, 0, just_do_it);
	return (0);
}
