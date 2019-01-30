module CodeCandy
  class Analysis
    class << self
      # 投稿結果の統計を返却する
      # contents allやwhereで取得したもの(モデルにlanguageが入っていれば使える)
      def statistics_result(contents)
        analysis = Hash.new(0)
        contents.each do |content|
          analysis[content.language] += 1
        end
        return analysis
      end

      # 投稿結果の統計を返却する
      def analysis_result(content)
        num = content.count
        language_proportion = statistics_result(content)
        language_proportion.keys.each do |language|
          language_proportion[language] /= num.to_f
        end
        return language_proportion.sort_by{|k, v| v}.reverse
      end
    end
  end
end
