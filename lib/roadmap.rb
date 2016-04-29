module Roadmap
  def get_roadmap(roadmap_id)
    headers = {content_type: 'application/json', authorization: @auth_token}
    response = RestClient.get "https://www.bloc.io/api/v1/roadmaps/#{roadmap_id}", headers
    JSON.parse(response)
  end

  def get_checkpoint(checkpoint_id)
    headers = {content_type: 'application/json', authorization: @auth_token}
    response = RestClient.get "https://www.bloc.io/api/v1/checkpoints/#{checkpoint_id}", headers
    JSON.parse(response)
  end
end
