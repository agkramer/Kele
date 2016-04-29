require 'json'
require 'rest_client'
require 'rubygems' if RUBY_VERSION < '1.9'
require 'pry'
require './roadmap'
require './messaging'

class Kele
  include Messaging
  include Roadmap

  def initialize(email, password)
    @email = email
    @password = password

    values = {email: @email, password: @password}
    headers = {content_type: 'application/json'}

    response = RestClient.post 'https://www.bloc.io/api/v1/sessions', values, headers
    @auth_token = JSON.parse(response)["auth_token"]
  end

  def get_me
    headers = {content_type: 'application/json', authorization: @auth_token}
    response = RestClient.get "https://www.bloc.io/api/v1/users/me", headers
    JSON.parse(response)
  end

  def get_mentor_availability(mentor_id)
    headers = {content_type: 'application/json', authorization: @auth_token}
    response = RestClient.get "https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers
    JSON.parse(response)
  end
end
