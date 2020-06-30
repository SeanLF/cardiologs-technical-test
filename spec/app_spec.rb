# frozen_string_literal: true

describe App do
  let(:app) { App }

  describe 'GET /' do
    it 'displays home page' do
      get '/'

      expect(last_response.status).to eq(200)
    end
  end

  describe 'Check if app is running' do
    it 'succeeds' do
      get '/check'

      expect(last_response.body).to include('itworks')
    end
  end
end
