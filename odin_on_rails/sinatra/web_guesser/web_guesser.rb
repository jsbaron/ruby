require 'sinatra'
require 'sinatra/reloader'

num = rand(100)
message = ""

get '/' do
    message = check_guess(params["guess"], num)
    erb:index, :locals => {:num => num, :message => message}
end

def check_guess(guess, num)
    guess = num_or_nil(guess)
    if guess.nil?
        message = "Invalid guess. Try again."
    elsif guess > num
        message = "#{guess} was too high! The correct number was #{num}."
    elsif guess < num
        message = "#{guess} was too low! The correct number was #{num}."
    else guess == num
        message = "Congrats! You guessed correctly! The correct number was #{num}."
    end
    return message
end

def num_or_nil(string)
    int_guess = string.to_i
    int_guess if int_guess.to_s == string
end