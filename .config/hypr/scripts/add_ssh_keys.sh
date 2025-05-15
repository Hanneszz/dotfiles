#!/bin/sh

# Set the path to your chosen ssh-askpass program
# Ensure this is the correct path if it's not in a standard /usr/bin location
export SSH_ASKPASS='/usr/bin/lxqt-openssh-askpass' # Or your chosen askpass program

# Optional: Control how ssh-add uses ssh-askpass
# 'prefer' tries a tty first, then askpass. 'force' always uses askpass.
# export SSH_ASKPASS_REQUIRE='prefer' 

# Add your specific key(s)
# The '< /dev/null' can sometimes help if ssh-add tries to read from stdin
# when it should be using SSH_ASKPASS.
ssh-add ~/.ssh/id_ed25519 < /dev/null

# You can add more keys here if needed
# ssh-add ~/.ssh/another_key < /dev/null
