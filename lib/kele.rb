require 'httparty'
require 'json'
require 'rest_client'
require 'rubygems'
require 'pry'

class Kele
  def initialize(email, password)
    @email = email
    @password = password

    data = {email: @email, password: @password}

    response = HTTParty.post("https://www.bloc.io/api/v1/sessions", {body: data})

    @auth_token = response["auth_token"]
  end

  def get_me
    headers = {:content_type => 'application/json', :authorization => @auth_token}
    response = RestClient.get 'https://www.bloc.io/api/v1/users/me', headers
    JSON.parse(response)
  end

  def get_mentor_availability(mentor_id)
    headers = {:content_type => 'application/json', :authorization => @auth_token}
    response = RestClient.get "https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers
    JSON.parse(response)
  end
end

# require './kele'
# kele_client = Kele.new("kramer.alleng@gmail.com", "helloworld")
# mentor_id = kele_client.get_me["current_enrollment"]["mentor_id"]
# mentor_id = 523730
# kele_client.get_mentor_availability(mentor_id)
