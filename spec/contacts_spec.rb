require("sinatra")
require("rspec")
require("pry")
require("contacts")

describe("Contact") do
  before() do
    Contact.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe ("#save") do
    it ("saves attributes to a list") do
      contact = Contact.new({:first=> 'Emily', :last=> 'Watkins' , :title=> "Rich", :company=> 'Nike'})
      contact.save()
      expect(Contact.all()).to(eq([contact]))
    end
  end

  describe(".clear") do
    it ('clears the array') do
      contact = Contact.new({:first=> 'Emily', :last=> 'Watkins' , :title=> "Rich", :company=> 'Nike'})
      contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))

    end
  end

end
