require 'sinatra'

get '/' do
  erb :index
end

post '/mail' do
  require 'pony'
  person = params
  puts params
  name = person[name]
  email = person[email]
  message = person[message]



  Pony.mail({
    :to => 'eai267@g.harvard.edu',
    :from => email,
    :subject => "#{name}  has contacted you about ZegDev",
    :body => "\n \n #{message} \n sent from #{name}",
    :via => :smtp,
    :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
    })


end
