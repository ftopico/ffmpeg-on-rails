# Ffmpeg class for ConcatenateWorker
class Ffmpeg::Concatenator

  attr_reader :video_filenames, :directory_output_filename
  # video_filenames = [<parent_filename.mp4>, <contrib_filename.mp4>]
  def initialize(video_filenames, directory_output_filename)
    @video_filenames = video_filenames
    @directory_output_filename = directory_output_filename
    #Convert files from mp4 to ts files
    @success = Ffmpeg::Mpegts.convert_to_ts(video_filenames)
  end

  def concat
    if @success
      @success = Ffmpeg::Base.new(builded_params).execute
    end

    { success: @success, filename: video_filenames.first }
  end

  private

  def builded_params
    Ffmpeg::ParamsBuilder.new(
      force_overwrite: true,
      input: "\"#{concat_filenames}\"",
      av_codec: "copy",
      bitstream_filter_audio: "aac_adtstoasc",
      output: directory_output_filename
    )
  end

  def concat_filenames
    "concat:" + video_filenames.map { |filename| "#{input_filename(filename)}ts" }.join("\|")
  end

  def input_filename(filename)
    ext = filename.split('.').last
    filename.chomp(ext)
  end
end
