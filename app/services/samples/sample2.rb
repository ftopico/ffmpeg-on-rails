class Samples::Sample2

  def initialize
    video_filenames = [ "tmp/sample1.mp4", "tmp/sample2.mp4" ]
    Ffmpeg::Concatenator.new(video_filenames, "tmp/output_concat.mp4").concat
  end
end
