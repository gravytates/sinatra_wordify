require('sinatra')
require('sinatra/reloader')
require('pry')
require('rspec')
require('./lib/wordify')

get('/') do
  erb(:index)
end

get('/results') do
  @input = params.fetch('input')
  @word = @input.to_i().wordify
  erb(:results)
end
