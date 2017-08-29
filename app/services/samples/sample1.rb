class Samples::Sample1

  def initialize
    options = {
      force_overwrite: true,
      input: "sample_video_files/sample1.mp4",
      video_codec: "libx264",
      crf: 18,
      preset: "superfast",
      video_filter: {
        scale: "1280:720:force_original_aspect_ratio=decrease",
        pad: "1280:720:(ow-iw)/2:(oh-ih)/2"
      },
      frame_rate: 29.97,
      audio_codec: "aac",
      audio_sampling_rate: 44100,
      audio_bitrate: "164k",
      strict: "experimental",
      output: "tmp/sample1.mp4"
    }
    params = Ffmpeg::ParamsBuilder.new(options)
    Ffmpeg::Transcoder.new(params).transcode

    options = {
      force_overwrite: true,
      input: "sample_video_files/sample2.mp4",
      video_codec: "libx264",
      crf: 18,
      preset: "superfast",
      video_filter: {
        scale: "1280:720:force_original_aspect_ratio=decrease",
        pad: "1280:720:(ow-iw)/2:(oh-ih)/2"
      },
      frame_rate: 29.97,
      audio_codec: "aac",
      audio_sampling_rate: 44100,
      audio_bitrate: "164k",
      strict: "experimental",
      output: "tmp/sample2.mp4"
    }
    params = Ffmpeg::ParamsBuilder.new(options)
    Ffmpeg::Transcoder.new(params).transcode
  end
end
