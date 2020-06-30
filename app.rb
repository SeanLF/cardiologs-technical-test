# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/r18n'

# require './helpers/date_helper'

# Sinatra app
class App < Sinatra::Application
  include R18n::Helpers
  register Sinatra::R18n
  set :root, __dir__

  # helpers

  get '/' do
    @stylesheet_name = 'index'
    erb :index
  end

  get '/check' do
    'itworks'
  end
end
