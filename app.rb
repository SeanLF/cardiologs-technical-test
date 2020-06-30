# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/r18n'
require './helpers/read_measurements_helper'
require './helpers/measurements_helper'
require 'byebug'

# Sinatra app
class App < Sinatra::Application
  include R18n::Helpers
  register Sinatra::R18n
  set :root, __dir__

  helpers ReadMeasurementsHelper, MeasurementsHelper

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

    # The number of P waves tagged "premature", as well as the number of QRS complexes tagged "premature"
    @premature_p_and_qrs_wave_count = premature_p_and_qrs_waves_count(@measurements)

    # The mean heart rate of the recording (Frequency at which QRS complexes appear).
    @mean_heart_rate = mean_heart_rate(@measurements)

    # The minimum and maximum heart rate, each with the time at which they happened.
    # As the date and the time of the recording are not included in the file, the client should be able to set them.

    erb :delineation_result
  end

  get '/check' do
    'itworks'
  end
end
