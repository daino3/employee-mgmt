
class Api::V1::BaseController < ApplicationController

  def respond_with(resource)
    super(:api, :v1, resource)
  end
end
