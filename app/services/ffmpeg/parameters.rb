# Class for the FFMPEG Parameters possible
class Ffmpeg::Parameters

  VALID_ORDERED_OPTIONS = {
    force_overwrite: "-y",
    input: "-i",
    subtitle_char_enc: "-sub_charenc",
    av_codec: "-c",
    video_codec: "-c:v",
    crf: "-crf",
    bitstream_filter_video: "-bsf:v",
    bitstream_filter_audio: "-bsf:a",
    preset: "-preset",
    video_filter: "-vf",
    frame_rate: "-r",
    audio_codec: "-c:a",
    audio_sampling_rate: "-ar",
    audio_bitrate: "-b:a",
    subtitle_codec: "-c:s",
    metadata: "-metadata:s:s:0",
    strict: "-strict",
    format: "-f",
    output: nil
  }

  VALID_VIDEO_FILTER = [
    :scale,
    :pad,
    :subtitles
  ]
end
