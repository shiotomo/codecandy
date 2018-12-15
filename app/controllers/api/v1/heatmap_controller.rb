class Api::V1::HeatmapController < Api::ApiController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: :show

  # heatmapの全データを返却するためのメソッド
  def index
    codes = current_user.codes.all
    results = current_user.results.all
    code_graph = codes.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    result_graph = results.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    graph = result_graph.merge(code_graph){|k, v1, v2| v1 + v2}
    render json: graph.to_json
  end

  # heatmapの1年分のデータを返却するためのメソッド
  def data
    # 1を足すことでその年の1月1日から12月31日のデータを取得できる
    date = Time.local(params[:year].to_i + 1)
    codes = current_user.codes.where(created_at: date.in_time_zone.all_year)
    results = current_user.results.where(created_at: date.in_time_zone.all_year)
    code_graph = codes.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    result_graph = results.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    graph = result_graph.merge(code_graph){|k, v1, v2| v1 + v2}
    render json: graph.to_json
  end

  # heatmapのデータを返却するためのメソッド(adminページ用)
  def show
    user = User.friendly.find(params[:id])
    codes = Code.where(user_id: user.id)
    results = Result.where(user_id: user.id)
    code_graph = codes.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    result_graph = results.map{|c| c.created_at.to_i}.inject(Hash.new(0)){|h, tm| h[tm] += 1; h}
    graph = result_graph.merge(code_graph){|k, v1, v2| v1 + v2}
    render json: graph.to_json
  end
end
