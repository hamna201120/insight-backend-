#!/usr/bin/env bash
set -o errexit

echo "🚀 Installing system dependencies..."
apt-get update
apt-get install -y ffmpeg

echo "🚀 FORCE REINSTALL setuptools (fix for pkg_resources)..."
pip uninstall setuptools -y
pip install setuptools==65.5.0 wheel

echo "🚀 Installing numpy first..."
pip install numpy==1.24.3 --no-cache-dir

echo "🚀 Installing CPU-only PyTorch..."
pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cpu --no-cache-dir

echo "📦 Installing openai-whisper WITHOUT dependencies first..."
pip install openai-whisper --no-deps

echo "📦 Installing remaining requirements..."
pip install -r requirements.txt --no-cache-dir

echo "🎤 Pre-downloading Whisper model..."
python -c "import whisper; whisper.load_model('tiny')"

echo "✅ Build complete!"
