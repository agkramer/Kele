require 'httparty'
require 'pry'

class Kele
  def initialize(email, password)
    @email = email
    @password = password

    data = {email: @email, password: @password}

    response = HTTParty.post("https://www.bloc.io/api/v1/sessions", {body: data})

    @auth_token = response["auth_token"]
  end
end
