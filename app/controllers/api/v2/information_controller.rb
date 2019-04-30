require './lib/code_candy/analysis'

class Api::V2::InformationController < Api::ApiController
  # CodeCandy V2 APIの状態を返却するメソッド
  # TODO コンテナで実行中のコード数などを取得して表示できるようにする
  def state
    state = {
      "status": "Active"
    }
    render json: state
  end
end
