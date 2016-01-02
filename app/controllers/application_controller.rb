class ApplicationController < ActionController::API
  before_action :authorize_request
  before_action :normalize_params, only: [:create, :update]

  def relationship_params
    associations = {}
    (params[:data][:relationships] || []).each do |key,value|
      associations[key.to_sym] = if value[:data].is_a? Array
        value[:data].map { |data| find_related_object(data) }
      else
        find_related_object(value[:data])
      end
    end
    associations
  end

  private

  def normalize_params
    return unless params[:data] && params[:data][:attributes]

    params[:data][:attributes].keys.each do |key|
      unless key.to_s.underscore == key
        params[:data][:attributes][key.to_s.underscore] = params[:data][:attributes][key]
        params[:data][:attributes].delete(key)
      end
    end
  end

  def authorize_request
    /^Bearer (?<bearer>.*)$/ =~ request.headers['Authorization']
    if AuthToken.where(token: bearer).count == 0
      render json: { error: "You need to authorize to do that" }, status: :unauthorized
    end
  end

  def find_related_object(data)
    return unless data && data[:type] && data[:id]
    klass = data[:type].underscore.classify.safe_constantize
    klass.find(data[:id]) if klass
  end

end
