require('sinatra')
require('sinatra/reloader')
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
  contact = Contact.new(first, last, title, company)
  contact.save()
  @list = Contact.all()
  erb(:input)
end

get('/output/:id') do
  @item = Contact.find(params[:id])
  erb(:output)
end
