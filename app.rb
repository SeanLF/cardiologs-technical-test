# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/r18n'
require './my_csv.rb'

# require './helpers/date_helper'

# Sinatra app
class App < Sinatra::Application
  include R18n::Helpers
  register Sinatra::R18n
  set :root, __dir__
  include MyCsv

  # helpers

  get '/' do
    redirect '/delineation'
  end

  get '/delineation' do
    @stylesheet_name = 'index'
    erb :delineation
  end

  post '/delineation' do
    return redirect '/delineation' unless params[:csv_file]

    @data = MyCsv.read(params[:csv_file][:tempfile])

    erb :delineation_result
  end

  get '/check' do
    'itworks'
  end
end
