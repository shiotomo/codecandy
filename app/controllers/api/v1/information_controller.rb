class Api::V1::InformationController < Api::ApiController

  # 投稿されているコードの割合を返却する
  def result
    results = Result.all

    num = results.count
    language_proportion = Hash.new(0)

    results.each do |result|
      language_proportion[:"#{result.language}"] += 1
    end

    language_proportion.keys.each do |language|
      language_proportion[language] /= num.to_f
    end

    render json: language_proportion
  end
end
