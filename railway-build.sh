#!/usr/bin/env bash
set -o errexit

echo "🚀 Installing FFmpeg..."
apt-get update
apt-get install -y ffmpeg

echo "🚀 Installing Python packages..."
pip install --upgrade pip setuptools wheel

# Install everything in one go
pip install -r requirements.txt --no-cache-dir

# Install Gemini separately
pip install google-generativeai==0.8.6 --no-cache-dir

echo "🎤 Pre-downloading Whisper model..."
python -c "import whisper; whisper.load_model('tiny')"

echo "✅ Build complete!"
