#!/usr/bin/env bash
set -o errexit

echo "🚀 Installing FFmpeg..."
apt-get update
apt-get install -y ffmpeg

echo "🚀 Installing setuptools..."
pip install --upgrade pip setuptools wheel

echo "🚀 Installing numpy..."
pip install numpy==1.24.3 --no-cache-dir

echo "🚀 Installing CPU PyTorch..."
pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cpu --no-cache-dir

echo "📦 Installing openai-whisper (WITHOUT dependencies)..."
pip install openai-whisper --no-deps

echo "📦 Installing google-generativeai (FIXED VERSION)..."
pip install google-generativeai==0.8.3 --no-cache-dir

echo "📦 Installing remaining requirements..."
pip install -r requirements.txt --no-cache-dir

echo "🎤 Pre-downloading Whisper model..."
python -c "import whisper; whisper.load_model('tiny')"

echo "✅ Build complete!"
