# Class for conversion of mp4 to ts file
class Ffmpeg::Mpegts

  attr_reader :video_filenames

  def self.convert_to_ts(video_filenames)
    success = true
    video_filenames.each do |input_filename|
      if !Ffmpeg::Base.new(builded_params(input_filename)).execute
        success = false
      end
    end
    success
  end

  private

  def self.builded_params(input_filename)
    Ffmpeg::ParamsBuilder.new(
      force_overwrite: true,
      input: input_filename,
      av_codec: "copy",
      bitstream_filter_video: "h264_mp4toannexb",
      format: "mpegts",
      output: ts_output_filename(input_filename)
    )
  end

  def self.ts_output_filename(input_filename)
    ext = input_filename.split('.').last
    input_filename.chomp(ext) + ("ts")
  end
end
