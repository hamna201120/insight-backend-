import whisper
import tempfile
import yt_dlp
import os

# Test if whisper loads
print("Testing Whisper...")
model = whisper.load_model("base")
print("✅ Whisper model loaded successfully")

# Test yt-dlp
print("\nTesting yt-dlp...")
ydl_opts = {'quiet': True}
with yt_dlp.YoutubeDL(ydl_opts) as ydl:
    info = ydl.extract_info("https://www.youtube.com/watch?v=dQw4w9WgXcQ", download=False)
    print(f"✅ yt-dlp working. Video title: {info.get('title', 'Unknown')}")

print("\n✅ All dependencies working!")