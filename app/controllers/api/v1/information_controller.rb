require './lib/code_candy/analysis'

class Api::V1::InformationController < Api::ApiController

  # 投稿されているコードの割合を返却する
  def result
    results = Result.all

    language_proportion = CodeCandy::Analysis.analysis_result(results)

    render json: language_proportion
  end
end
