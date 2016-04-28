module Messaging
  def get_messages
    headers = {:content_type => 'application/json', :authorization => @auth_token}
    response = RestClient.get "https://www.bloc.io/api/v1/message_threads", headers
    JSON.parse(response)
  end

  # def create_message
  #   headers = {:content_type => 'application/json', :authorization => @auth_token}
  #   values = "{
  #     'user_id': 1,
  #     'recipient_id': 2,
  #     'token': 'abcd',
  #     'subject': 'Royale with cheese',
  #     'stripped-text': 'That is what they call a quarter pounder in France.'
  #   }"
  #
  #   response = RestClient.post "https://www.bloc.io/api/v1/messages", {body: values}, headers
  #   puts response
  # end
end
