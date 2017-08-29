# Main class for Transcoding
class Ffmpeg::Transcoder < Ffmpeg::Base

  def transcode
    execute
  end
end
