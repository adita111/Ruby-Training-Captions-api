require 'mini_magick'
require "securerandom"

class CaptionGenerator

  def self.generate (image_path, text)
    image = MiniMagick::Image.open(image_path)

    image.combine_options do |config|
      config.gravity "north"
      config.fill "black"
      config.pointsize "40"
      config.annotate "0,20", text
    end

    extension = File.extname(image_path.to_s)
    filename = "caption_#{SecureRandom.hex(8)}#{extension}"
    output_path = Rails.root.join("public", "images", filename)

    image.write(output_path)

    "/images/#{filename}"

  end
end