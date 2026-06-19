#!/usr/bin/env bash
set -o errexit

echo "🚀 Installing FFmpeg..."
apt-get update
apt-get install -y ffmpeg

echo "🚀 Installing Python build tools..."
pip install --upgrade pip setuptools wheel

echo "🚀 Installing numpy first..."
pip install numpy==1.24.3 --no-cache-dir

echo "🚀 Installing numba (required for whisper)..."
pip install numba==0.58.1 --no-cache-dir

echo "🚀 Installing CPU PyTorch (2.0.1)..."
pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cpu --no-cache-dir

echo "🚀 Installing tiktoken and regex..."
pip install tiktoken==0.5.2 regex==2023.12.25 --no-cache-dir

echo "📦 Installing openai-whisper (WITHOUT dependencies)..."
pip install openai-whisper --no-deps

echo "📦 Installing Google Generative AI..."
pip install google-generativeai==0.8.6 --no-cache-dir

# ⭐ CRITICAL: Pin transformers & sentence-transformers for PyTorch 2.0.1
echo "📦 Installing transformers (compatible with PyTorch 2.0.1)..."
pip install transformers==4.30.0 --no-cache-dir

echo "📦 Installing sentence-transformers (compatible with PyTorch 2.0.1)..."
pip install sentence-transformers==2.2.0 --no-cache-dir

echo "📦 Installing remaining requirements..."
pip install -r requirements.txt --no-cache-dir

echo "🎤 Pre-downloading Whisper model..."
python -c "import whisper; whisper.load_model('tiny')"

echo "✅ Build complete!"
