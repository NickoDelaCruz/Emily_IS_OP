class Contact
  @@list = []

  attr_accessor :first
  attr_accessor :last
  attr_accessor :title
  attr_accessor :company
  attr_reader :id

  def initialize(attributes)
    @first = attributes.fetch(:first)
    @last = attributes.fetch(:last)
    @title = attributes.fetch(:title)
    @company = attributes.fetch(:company)
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def self.clear()
    @@list = []
  end

  def save()
    @@list.push(self)
  end

  def self.find(id)
    contact_id = id.to_i()
    @@list.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end

end
