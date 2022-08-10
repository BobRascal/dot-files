#
# ~/.zprofile
#

#amixer set "Master" 40%
#amixer set "Master Mono" 40%
#amixer set "Headphone" 40%
#amixer set "3D Control - Switch" unmute
#amixer set "PCM Out Path & Mute" post\ 3D

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
