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

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      contact = Contact.new({:first=> 'Emily', :last=> 'Watkins' , :title=> "Rich", :company=> 'Nike'})
      contact.save()
      contact2 = Contact.new({:first=> 'Nicko', :last=> 'De la Cruz' , :title=> "double rich", :company=> 'spacex'})
      contact2.save()
      expect(contact.id()).to(eq(1))
      expect(contact2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds an item based on its id") do
      contact = Contact.new({:first=> 'Emily', :last=> 'Watkins' , :title=> "Rich", :company=> 'Nike'})
      contact.save()
      contact2 = Contact.new({:first=> 'Nicko', :last=> 'De la Cruz' , :title=> "double rich", :company=> 'spacex'})
      contact2.save()
      expect(Contact.find(1)).to(eq(contact))
      expect(Contact.find(2)).to(eq(contact2))
    end
  end
  
end
