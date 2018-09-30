class Api::V1::HeatmapController < Api::ApiController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: :show

  # heatmapのデータを返却するためのメソッド
  def index
    codes = current_user.codes.all
    results = current_user.codes.all
    graph = results.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    graph.merge(codes.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}){|k, v1, v2| v1 + v2}
    render json: graph.to_json
  end

  def show
    user = User.friendly.find(params[:id])
    codes = Code.where(user_id: user.id)
    results = Result.where(user_id: user.id)
    graph = codes.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    graph.merge(results.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}){|k, v1, v2| v1 + v2}
    render json: graph.to_json
  end
end
