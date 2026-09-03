
#Create and destroy Caption
class CaptionService
  def self.create(params)
    Caption.create(params)
  end

  def self.destroy(id)
    caption = Caption.find(id)
    caption.destroy
  end
end