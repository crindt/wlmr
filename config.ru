require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/recaptcha'

Bundler.require(:default)

use Rack::ConditionalGet

# breaks mail posting
#use Rack::ETag


configure do
  # https://admin.recaptcha.net/accounts/signup/
  Sinatra::ReCaptcha.public_key  = ENV['RECAPTCHA_PUBLIC_KEY']
  Sinatra::ReCaptcha.private_key = ENV['RECAPTCHA_PRIVATE_KEY']
  # to use ssl set Sinatra::ReCaptcha.server = 'https://api-secure.recaptcha.net'
end


require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'
run Nesta::App

