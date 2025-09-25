#!/bin/bash
set -e

echo "🔐 Starting SSH deployment..."

# Validate required environment variables
if [[ -z "$INPUT_HOST" || -z "$INPUT_USERNAME" || -z "$INPUT_KEY" ]]; then
  echo "❌ Missing required SSH configuration. Check INPUT_HOST, INPUT_USERNAME, and INPUT_KEY."
  exit 1
fi

# Optional settings
PORT=${INPUT_PORT:-22}
SCRIPT=${INPUT_SCRIPT:-"echo Hello from remote"}
TIMEOUT=${INPUT_TIMEOUT:-30}

# Create a temporary key file
KEY_FILE=$(mktemp)
echo "$INPUT_KEY" > "$KEY_FILE"
chmod 600 "$KEY_FILE"

echo "📡 Connecting to $INPUT_USERNAME@$INPUT_HOST on port $PORT"

# Run the remote script
ssh -o StrictHostKeyChecking=no \
    -i "$KEY_FILE" \
    -p "$PORT" \
    "$INPUT_USERNAME@$INPUT_HOST" \
    "$SCRIPT"

echo "✅ Deployment finished."

# Cleanup
rm -f "$KEY_FILE"
