#!/bin/bash

# Nome dos sinks
SINK_HDMI="alsa_output.pci-0000_01_00.1.hdmi-stereo"
SINK_ANALOG="alsa_output.pci-0000_00_1b.0.analog-stereo"

# Obter o sink atual
CURRENT_SINK=$(pactl info | grep "Default Sink" | cut -d " " -f3)

# Alternar entre os sinks
if [ "$CURRENT_SINK" == "$SINK_HDMI" ]; then
    pactl set-default-sink $SINK_ANALOG
else
    pactl set-default-sink $SINK_HDMI
fi
