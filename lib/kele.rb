require 'httparty'
require 'json'
require 'rest_client'
require 'rubygems'
require 'pry'
require './roadmap'
require './messaging'

class Kele
  include Roadmap
  include Messaging

  def initialize(email, password)
    @email = email
    @password = password

    data = {email: @email, password: @password}

    response = HTTParty.post("https://www.bloc.io/api/v1/sessions", {body: data})
    @auth_token = response["auth_token"]
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
