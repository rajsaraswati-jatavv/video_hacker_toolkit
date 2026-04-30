# 🎬 Video Hacker Toolkit

[![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![FFmpeg](https://img.shields.io/badge/FFmpeg-007808?style=for-the-badge&logo=ffmpeg&logoColor=white)](https://ffmpeg.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

> A powerful, modular video processing toolkit for Termux and Linux — convert, compress, cut, merge, watermark, extract audio, OCR, and more. Built by [T3rmuxk1ng](https://youtube.com/@T3rmuxk1ng).

---

## ✨ Features

- 🎥 **Video Conversion** — Convert between any video format (mp4, mkv, avi, webm, mov)
- ✂️ **Video Cutting** — Precise cut/trim with timestamp support
- 🔗 **Video Merging** — Merge multiple videos into one
- 🎵 **Audio Extraction** — Extract audio from video files
- 🗜️ **Video Compression** — Reduce file size with quality control
- 💧 **Watermark** — Add text/image watermarks to videos
- 🎞️ **GIF Creation** — Convert video clips to animated GIFs
- 🖼️ **OCR** — Extract text from video frames
- ✨ **Effects** — Apply visual effects and filters
- 📋 **Batch Processing** — Process multiple files at once
- 🔍 **Video Info** — Get detailed media information
- 🔐 **Integrity Check** — Verify video file integrity

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Bash** | Core scripting language |
| **FFmpeg** | Video/audio processing engine |
| **Tesseract OCR** | Text extraction from frames |
| **ImageMagick** | Image processing & watermarks |

---

## 🚀 Installation

### Termux
```bash
# Install dependencies
pkg update && pkg upgrade
pkg install ffmpeg tesseract imagemagick

# Clone the repository
git clone https://github.com/rajsaraswati-jatavv/video_hacker_toolkit.git
cd video_hacker_toolkit

# Make executable
chmod +x home/bin/ultra_video_hacker_toolkit.sh
chmod +x home/bin/modules/*.sh

# Run
./home/bin/ultra_video_hacker_toolkit.sh
```

### Linux
```bash
# Install dependencies
sudo apt install ffmpeg tesseract-ocr imagemagick

# Clone and run
git clone https://github.com/rajsaraswati-jatavv/video_hacker_toolkit.git
cd video_hacker_toolkit
chmod +x home/bin/ultra_video_hacker_toolkit.sh
```

---

## 📁 Project Structure

```
video_hacker_toolkit/
├── README.md                            # This file
├── api/
│   ├── openapi.yaml                     # API specification
│   ├── server.sh                        # API server
│   └── client.sh                        # API client
├── home/
│   ├── bin/
│   │   ├── ultra_video_hacker_toolkit.sh # Main entry point
│   │   ├── utils.sh                     # Shared utilities
│   │   └── modules/
│   │       ├── convert.sh               # Format conversion
│   │       ├── compress.sh              # Video compression
│   │       ├── cut.sh                   # Video cutting/trimming
│   │       ├── merge.sh                 # Video merging
│   │       ├── audio.sh                 # Audio extraction
│   │       ├── watermark.sh             # Watermarking
│   │       ├── gif.sh                   # GIF creation
│   │       ├── ocr.sh                   # OCR text extraction
│   │       ├── effects.sh               # Visual effects
│   │       ├── batch.sh                 # Batch processing
│   │       ├── info.sh                  # Media information
│   │       └── integrity.sh             # File integrity check
│   ├── docs/                            # Documentation
│   ├── tests/                           # Test scripts
│   ├── work/logs/                       # Log files
│   └── .env.example                     # Environment config
```

---

## 📋 Module Usage

```bash
# Convert video
./home/bin/modules/convert.sh input.avi output.mp4

# Cut video (from 00:01:30 to 00:02:00)
./home/bin/modules/cut.sh input.mp4 00:01:30 00:02:00 output.mp4

# Compress video (50% quality)
./home/bin/modules/compress.sh input.mp4 50 output.mp4

# Extract audio
./home/bin/modules/audio.sh input.mp4 output.mp3

# Merge videos
./home/bin/modules/merge.sh video1.mp4 video2.mp4 output.mp4

# Create GIF
./home/bin/modules/gif.sh input.mp4 output.gif

# Get video info
./home/bin/modules/info.sh input.mp4
```

---

## ⚙️ Configuration

Copy the example env file and customize:

```bash
cp home/.env.example home/.env
```

---

## 📺 YouTube

> Learn how to build powerful shell tools! Watch tutorials on **[T3rmuxk1ng YouTube Channel](https://youtube.com/@T3rmuxk1ng)**

---

## 👤 Author

**Rajsaraswati Jatav (T3rmuxk1ng)**

- YouTube: [https://youtube.com/@T3rmuxk1ng](https://youtube.com/@T3rmuxk1ng)
- GitHub: [rajsaraswati-jatavv](https://github.com/rajsaraswati-jatavv)

---

## ⚠️ Disclaimer

This toolkit is for **educational and personal use only**. Use responsibly and in accordance with applicable laws.

---

## 📄 License

This project is licensed under the MIT License.

---

<div align="center">

**If you found this project useful, give it a star!**

[YouTube](https://youtube.com/@T3rmuxk1ng) | [GitHub](https://github.com/rajsaraswati-jatavv)

</div>
