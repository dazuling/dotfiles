{ pkgs }:

pkgs.writeShellScriptBin "i3-change-audio" ''
  set -euo pipefail

  wired_headphones_sink="alsa_output.pci-0000_0d_00.4.analog-stereo"
  bt_speaker_sink="bluez_sink.78_2B_64_5C_F4_AA.a2dp_sink"
  bt_headphones_sink="bluez_sink.CC_98_8B_E3_18_BC.a2dp_sink"

  default_sink="$(pactl get-default-sink)"

  function sink_exists() {
    pactl list sinks | grep "$1"
  }

  # Compute the new sink. We cycle through the configured sinks in the order of:
  # 1. Wired headphones
  # 2. Bluetooth speaker
  # 2. Bluetooth headphones
  # Kind of lazy and bash is hard, so I just expanded the rotation into conditionals.
  new_sink=
  if [[ "$default_sink" == "$wired_headphones_sink" ]]; then
    if sink_exists "$bt_speaker_sink"; then
      new_sink="$bt_speaker_sink"
    elif sink_exists "$bt_headphones_sink"; then
      new_sink="$bt_headphones_sink"
    fi
  elif [[ "$default_sink" == "$bt_speaker_sink" ]]; then
    if sink_exists "$bt_headphones_sink"; then
      new_sink="$bt_headphones_sink"
    elif sink_exists "$wired_headphones_sink"; then
      new_sink="$wired_headphones_sink"
    fi
  elif [[ "$default_sink" == "$bt_headphones_sink" ]]; then
    if sink_exists "$wired_headphones_sink"; then
      new_sink="$wired_headphones_sink"
    elif sink_exists "$bt_speaker_sink"; then
      new_sink="$bt_speaker_sink"
    fi
  fi

  if [[ -z "$new_sink" ]]; then
    notify-send "No other audio sinks connected."
    exit 0
  fi

  # Notify the user.
  if [[ "$new_sink" == "$wired_headphones_sink" ]]; then
    notify-send "Switched audio to wired headphones."
  elif [[ "$new_sink" == "$bt_speaker_sink" ]]; then
    notify-send "Switched audio to bluetooth speaker."
  elif [[ "$new_sink" == "$bt_headphones_sink" ]]; then
    notify-send "Switched audio to bluetooth headphones."
  fi

  # Update pulseaudio's default sink.
  echo "new_sink=$new_sink"
  pactl set-default-sink "$new_sink"

  # Update existing applications to output to the new sink.
  # Will fail if there are no existing applications.
  pactl list sink-inputs | \
    grep 'Sink Input #' | \
    cut -d'#' -f2 | \
    xargs -I{} sh -c "pactl move-sink-input {} $new_sink"
''
