class Samples::Sample3

  def initialize
    options = {
      force_overwrite: true,
      input: "tmp/output_concat.mp4",
      video_codec: "libx264",
      video_filter: { subtitles: "sample_video_files/output.srt"},
      subtitle_codec: "mov_text",
      output: "tmp/output_with_subs.mp4"
    }
    params = Ffmpeg::ParamsBuilder.new(options)
    Ffmpeg::Base.new(params).execute
  end
end
