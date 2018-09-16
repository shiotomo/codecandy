class Api::V1::HeatmapController < Api::ApiController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: :show

  # heatmapのデータを返却するためのメソッド
  def index
    results = current_user.results.all
    graph = results.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    render json: graph.to_json
  end

  def show
    user = User.friendly.find(params[:id])
    results = Result.where(user_id: user.id)
    graph = results.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    render json: graph.to_json
  end
end
