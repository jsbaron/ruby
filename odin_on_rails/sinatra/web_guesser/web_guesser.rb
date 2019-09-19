require 'sinatra'
require 'sinatra/reloader'

num = rand(100)

get '/' do
    "the random number is #{num}"
end