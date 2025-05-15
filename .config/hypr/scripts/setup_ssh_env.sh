#!/bin/sh

# Define the expected socket path
# $XDG_RUNTIME_DIR is usually /run/user/<UID>
SSH_SOCKET_PATH="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Check if the ssh-agent socket exists.
# This implies ssh-agent.service is likely running and has created it.
if [ -S "$SSH_SOCKET_PATH" ]; then
  # Export the variable for the current script's environment
  export SSH_AUTH_SOCK="$SSH_SOCKET_PATH"

  # Import SSH_AUTH_SOCK into the systemd user environment.
  # This makes it visible to `systemctl --user show-environment`.
  systemctl --user import-environment SSH_AUTH_SOCK

  # Update the D-Bus session environment.
  # This is important for applications that use D-Bus for startup or communication.
  # Include other variables Hyprland might set if needed by D-Bus activated apps.
  dbus-update-activation-environment --systemd SSH_AUTH_SOCK DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
fi
