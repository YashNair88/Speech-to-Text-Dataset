input_dir="$1"
output_dir="$2"
num_cpus="$3"

find "$input_dir" -name "*.mp3" -type f -print0 | xargs -0 -P "$num_cpus" -I {} sh -c '
    file="$1"
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    ffmpeg -i "$file" -acodec pcm_s16le -ac 1 -ar 16000 "$output_dir/$filename.wav"
' -- {}

echo "Audio files conversion completed."