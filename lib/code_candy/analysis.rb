module CodeCandy
  class Analysis
    # 投稿結果の統計を返却する
    class << self
      def statistics_result(contents)
        analysis = Hash.new(0)

        contents.each do |content|
          analysis[content.language] += 1
        end

        return analysis
      end

      def analysis_result(content)
        num = content.count
        language_proportion = statistics_result(content)

        language_proportion.keys.each do |language|
          language_proportion[language] /= num.to_f
        end

        return language_proportion
      end
    end
  end
end
