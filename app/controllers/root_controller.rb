class RootController < ActionController::API
  def index
    current_revision = $redis.get('relationship:index:current')
    render html: $redis.get("relationship:index:#{current_revision}").html_safe
  end
end
