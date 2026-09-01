require "uri"
require "net/http"
require "securerandom"

class ImageDownloader
  def self.download(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)

    unless response.is_a?(Net::HTTPSuccess)
      raise "Image download failed with status #{response.code}"
    end

    extension = File.extname(uri.path)
    filename = "original_#{SecureRandom.hex(8)}#{extension}"
    path = Rails.root.join("public", "images", filename)

    File.open(path, "wb") do |file|
      file.write(response.body)
    end

    path
  end
end