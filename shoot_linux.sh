#!/usr/bin/env bash
set -e

# Usage:
#   ./shoot_linux.sh [experiment_xml]
# Example:
#   ./shoot_linux.sh experiments/Random_CPFA_r24_tag256_10by10.xml

EXPERIMENT_FILE="${1:-experiments/Random_CPFA_r24_tag256_10by10.xml}"

# Hybrid GPU offload hints for common Linux stacks.
export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export DRI_PRIME=1

# WSL/mesa-d3d12 adapter selection hint (harmless on non-WSL systems).
export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA

exec argos3 -c "$EXPERIMENT_FILE"
