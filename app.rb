# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/r18n'
require './helpers/read_measurements_helper'

# Sinatra app
class App < Sinatra::Application
  include R18n::Helpers
  register Sinatra::R18n
  set :root, __dir__

  helpers ReadMeasurementsHelper

  get '/' do
    redirect '/delineation'
  end

  get '/delineation' do
    @stylesheet_name = 'index'
    erb :delineation
  end

  post '/delineation' do
    return redirect '/delineation' unless params[:csv_file]

    @measurements = read_measurements(params[:csv_file][:tempfile])

    @premature_p_and_qrs_waves = @measurements.count { |m| (m.p_wave? || m.qrs_wave?) && m.wave_tags.include?('premature') }

    erb :delineation_result
  end

  get '/check' do
    'itworks'
  end
end
