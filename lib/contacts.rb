class Contact
  @@list = []

  attr_accessor :first
  attr_accessor :last
  attr_accessor :title
  attr_accessor :company

  def initialize(attributes)
    @first = attributes.fetch(:first)
    @last = attributes.fetch(:last)
    @title = attributes.fetch(:title)
    @company = attributes.fetch(:company)
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

end
