class ApplicationController < ActionController::API
  before_action :authorize_request

  def relationship_params
    associations = {}
    params[:data][:relationships].each do |key,value|
      associations[key.to_sym] = if value[:data].is_a? Array
        value[:data].map { |data| find_related_object(data) }
      else
        find_related_object(value[:data])
      end
    end
    associations
  end

  private

  def authorize_request
    /^Bearer (?<bearer>.*)$/ =~ request.headers['Authorization']
    if AuthToken.where(token: bearer).count == 0
      render json: { error: "You need to authorize to do that" }, status: :unauthorized
    end
  end

  def find_related_object(data)
    return unless data[:type] && data[:id]
    klass = data[:type].underscore.classify.safe_constantize
    klass.find(data[:id]) if klass
  end

end
