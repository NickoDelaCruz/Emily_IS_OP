require("sinatra")
require("rspec")
require("pry")
require("contacts")

describe("Contact") do

  describe ("#save") do
    it ("saves attributes to a list") do
      contact = Contact.new({:first=> 'Emily', :last=> 'Watkins' , :title=> "Rich", :company=> 'Nike'})
      contact.save()
      expect(contact.save()).to(eq([contact]))
    end
  end

end
