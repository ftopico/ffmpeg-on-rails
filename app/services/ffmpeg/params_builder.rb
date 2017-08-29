# Class to build the options to FFMPEG Params
class Ffmpeg::ParamsBuilder
  attr_reader :options

  def initialize(options = {})
    @options = options
  end

  def build
    Ffmpeg::Parameters::VALID_ORDERED_OPTIONS.map do |key, ffmpeg_option|
      next if options[key].nil?
      if key == :output
        "#{options[key]}"
      elsif key == :video_filter
        "#{ffmpeg_option} #{video_filter_builder(options[key])}"
      elsif key == :force_overwrite
        "#{ffmpeg_option}"
      elsif key == :input
        "#{inputs_builder(options[key])}"
      else
        "#{ffmpeg_option} #{options[key]}"
      end
    end.reject(&:blank?).join(" ")
  end

  private

  def inputs_builder(input)
    if input.class == String
      "-i #{input}"
    elsif input.class == Array
      input.map { |string_input| "-i #{string_input}" }.join(" ")
    end
  end

  def video_filter_builder(video_filters = {})
    vf_params = video_filters.map do |filter, value|
      if Ffmpeg::Parameters::VALID_VIDEO_FILTER.include?(filter)
        "#{filter}=#{value}"
      end
    end.reject(&:blank?).join(",")

    "\"#{vf_params}\""
  end
end
