#!/bin/bash

# Set the OpenAI API Key
export OPENAI_API_KEY="your-openai-api-key"

# Navigate to the Smyth runtime directory
cd /Users/macbookpro/Desktop/overtimestaff/smyth-runtime-local || exit

# Run the Smyth agent
./bin/smyth-runtime-macos \
  --agent agents/llm.smyth \
  --vault /Users/macbookpro/Desktop/overtimestaff/smyth-runtime-local/vault.json \
  --post question="$1" \
  --endpoint ask
