#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clear Workspaces 2 & 3
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🚚

# Get all window IDs from workspace 2 and move them to 5
for id in $(aerospace list-windows --workspace 2 --format %{window-id}); do
    aerospace move-node-to-workspace 5 --window-id "$id"
done

# Get all window IDs from workspace 3 and move them to 5
for id in $(aerospace list-windows --workspace 3 --format %{window-id}); do
    aerospace move-node-to-workspace 5 --window-id "$id"
done

# Optional: Focus workspace 5 after moving everything
aerospace workspace 5
