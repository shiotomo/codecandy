require './lib/code_candy/analysis'

class Api::V1::InformationController < Api::ApiController
  # CodeCandyの状態を返却するメソッド
  # TODO コンテナで実行中のコード数などを取得して表示できるようにする
  def state
    state = {
      "status": "Active"
    }
    render json: state
  end

  # 投稿されているResultテーブルのコードの割合を返却する
  def result
    results = Result.all
    language_proportion = CodeCandy::Analysis.analysis_result(results)
    render json: language_proportion
  end

  # 投稿されているCodeテーブルのコードの割合を返却する
  def code
    codes = Code.all
    language_proportion = CodeCandy::Analysis.analysis_result(codes)
    render json: language_proportion
  end

  # 投稿されている全コードの割合を返却する
  def all_code
    results = Result.all
    codes = Code.all
    analysis_results = CodeCandy::Analysis.statistics_result(results)
    analysis_codes = CodeCandy::Analysis.statistics_result(codes)
    analysis = analysis_results.merge(analysis_codes){|k, v1, v2| v1 + v2}
    language_proportion = analysis.sort_by{|k, v| v}.reverse
    render json: language_proportion
  end
end
