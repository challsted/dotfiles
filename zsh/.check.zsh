# Preforms several checks to make sure the user is
#  Running Linux, and then checks what OS the user is using.
if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

# Checks if the user is on Ubuntu or a derivative
if [[ -x `which apt-get` ]]; then
    HAS_APT=1
fi

# Checks if the user is on Fedora, RHEL or Cent
if [[ -x `which yum` ]]; then
    HAS_YUM=1
fi

# Checks if the user is on Arch
if [[ -x `which pacman` ]]; then
    HAS_PACMAN=1
fi
