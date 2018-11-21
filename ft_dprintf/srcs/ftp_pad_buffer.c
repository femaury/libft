/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_pad_buffer.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: femaury <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/05/12 17:45:30 by femaury           #+#    #+#             */
/*   Updated: 2018/09/25 17:55:38 by femaury          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libftdprintf.h"

void		ftp_pad_buffer(t_buffer *buff, char pad, size_t len)
{
	unsigned int	i;

	i = 0;
	if ((int)len < 0)
		return ;
	while (i < len)
	{
		if (buff->pos == BUFF_SIZE)
		{
			write(buff->fd, buff->str, BUFF_SIZE);
			ft_strnclr(buff->str, BUFF_SIZE);
			buff->len += buff->pos;
			buff->pos = 0;
		}
		buff->str[buff->pos++] = pad;
		i++;
	}
}
