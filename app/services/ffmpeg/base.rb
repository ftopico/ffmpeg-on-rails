# Base class for FFMPEG
class Ffmpeg::Base

  attr_reader :ffmpeg, :ffmpeg_params_string, :ffmpeg_params

  FFMPEG = "ffmpeg/ffmpeg"
  FFMPEG_MAC = "ffmpeg/ffmpeg-mac"

  def initialize(ffmpeg_params_builder=nil)
    @ffmpeg_params = ffmpeg_params_builder
    @ffmpeg_params_string = ffmpeg_params_builder.class == Ffmpeg::ParamsBuilder ? ffmpeg_params_builder.build : ""
    @ffmpeg = Ffmpeg::Os.linux? ? FFMPEG : FFMPEG_MAC
  end

  def execute
    system("#{ffmpeg} #{ffmpeg_params_string}")
  end

  def output_directory_filename
    filename = ffmpeg_params.options[:input]
    ext = File.extname(filename)       # => ".mp4"
    File.basename(filename, ext)    # => "abc"
  end

  # FFMPEG straight params
  # Example:
  # Ffmpeg::Base.execute("-i sample.mp4 -vf \"scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2\"")
  def self.execute(ffmpeg_params_string)
    ffmpeg = Ffmpeg::Os.linux? ? Ffmpeg::Base::FFMPEG : Ffmpeg::Base::FFMPEG_MAC
    system("#{ffmpeg} #{ffmpeg_params_string}")
  end
end
