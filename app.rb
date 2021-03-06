require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/contacts')

get('/') do
  @list = Contact.all()
  erb(:input)
end

post('/') do
  first = params["first"]
  last = params["last"]
  title = params["title"]
  company = params["company"]
  contact = Contact.new({:first=> first, :last=> last , :title=> title, :company=> company})
  contact.save()
  @list = Contact.all()
  erb(:input)
end

get('/output/:id') do
  @contact = Contact.find(params[:id])
  erb(:output)
end

post('/output') do
  street = params["street"]
  city = params["city"]
  state = params["state"]
  zip = params["zip"]
  address = Address.new({:street=> street, :city=> city , :state=> state, :zip=> zip})
  address.save()
  @address_list = Address.all()
  erb(:address)
end

get('/address') do
  @address = Address.all()
  erb(:address)
end
