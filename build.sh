#!/usr/bin/env bash
set -euo pipefail

ASSET_ORIGIN="https://sb-1q12a7bxmowu.vercel.run"
mkdir -p dist/assets
cp index.html dist/index.html

assets=(
  "memory-01-mirror-red-closeup.webp"
  "memory-02-red-outfit.webp"
  "memory-03-rose-in-the-car.webp"
  "memory-04-car-hug.webp"
  "memory-05-playful-car-selfie.webp"
  "memory-06-mirror-striped-top.webp"
  "memory-07-hotel-mirror.webp"
  "memory-08-together-full.webp"
  "memory-09-together-mirror.webp"
  "memory-10-together-casual.webp"
  "memory-11-brown-outfit.webp"
  "memory-12-brown-outfit-elevator.webp"
  "memory-video-01.mp4"
  "memory-video-02.mp4"
  "mere-mann-ki-roshni.mp3"
)

for asset in "${assets[@]}"; do
  echo "Fetching ${asset}"
  curl --fail --silent --show-error --location --retry 5 --retry-delay 1 \
    "${ASSET_ORIGIN}/assets/${asset}" \
    --output "dist/assets/${asset}"
done

echo "Static site assembled in dist/"
