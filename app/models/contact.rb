class Contact
  
  include ActiveModel::Validations
  
  validates :email, :sender_name, :content, :presence => true
  attr_accessor :id, :email, :name, :body
  
  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end
  
  def read_attribute_for_validation(key)
    @attributes[key]
  end
  
  def to_key
  end
  
  def save
    if self.valid?
      Notifier.contact_us(self).deliver
      return true
    end
    return false
  end
end
