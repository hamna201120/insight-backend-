#!/usr/bin/env bash
set -o errexit

echo "🚀 Installing system dependencies..."
apt-get update
apt-get install -y ffmpeg

echo "🚀 Installing Python build tools..."
pip install --upgrade pip setuptools wheel

echo "🚀 Installing numpy first..."
pip install numpy==1.24.3 --no-cache-dir

echo "🚀 Installing CPU-only PyTorch..."
pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cpu --no-cache-dir

echo "📦 Installing requirements..."
pip install -r requirements.txt --no-cache-dir

echo "🎤 Pre-downloading Whisper model (tiny)..."
python -c "import whisper; whisper.load_model('tiny')"

echo "✅ Build complete!"
