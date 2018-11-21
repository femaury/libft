/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ftp_check_wstr.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: femaury <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/05/22 11:43:35 by femaury           #+#    #+#             */
/*   Updated: 2018/09/25 17:53:40 by femaury          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libftdprintf.h"

int		ftp_check_wstr(t_buffer *buff, wchar_t *wstr)
{
	while (*wstr != L'\0')
	{
		if (*wstr > 0x10FFFF || (*wstr >= 0xD800 && *wstr <= 0xDFFF))
		{
			buff->error |= 1;
			return (0);
		}
		wstr++;
	}
	return (1);
}
