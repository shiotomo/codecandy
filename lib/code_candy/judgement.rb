require './lib/code_candy/compiler'
require './lib/code_candy/parameter'

module CodeCandy
  class Judgement
    def initialize(language, source_code, id, user)
      # 送られてきたパラメータを変数に格納
      @language = language
      @source_code = source_code
      @id = id
      @user = user

      # コンテナモジュールのインスタンスを生成
      @compiler = CodeCandy::Compiler.new

      # 問題の標準入出力を呼び出し
      @answers = Question.find(id).answers

      # 実行結果を保持しておくフラグ
      @answer_flag = true

      @submit_language = CodeCandy::Parameter.get_submit_language(language)
    end

    def exec
      result = {}

      @answers.each do |answer|
        # コンテナに言語、ソースコード、標準入力を与えて提出されたプログラムを実行する
        result = @compiler.exec(@language, @source_code, answer.input)

        # 不正な入力があった場合その時点でエラーメッセージを返却する
        return result if result[:input_error]

        result[:stdout] = result[:stdout].force_encoding("UTF-8")
        # 標準出力の整形
        # 提出コードの標準出力: stdout
        # 提出コードの標準出力は行末の空白、改行を削除する
        # 解答用の標準出力:output
        # 解答用の標準出力は行末の空白、改行を削除する
        output = answer.output
        output = output.gsub(/\r/, "")
        output = output.gsub(/\s+$/, "").rstrip
        stdout = result[:stdout].rstrip

        # 正解だったらanswer_flagをtrueに、違う場合はfalseにしてループを抜ける
        if stdout == output
          @answer_flag = true
        else
          @answer_flag = false
          break
        end
      end

      # result[:answer]に結果を格納する
      if @answer_flag
        result[:answer] = "正解"
      else
        result[:answer] = "不正解"
      end

      # resultレコードメソッドを呼び出す
      result_submit(@answer_flag, @id, @source_code, @submit_language, @user)

      # UTF-8にencodeする
      result[:stdout] = result[:stdout].force_encoding("UTF-8")
      result[:stderr] = result[:stderr].force_encoding("UTF-8")

      return result
    end

    private
    # 結果を保存するメソッド
    def result_submit(answer_flag, id, source_code, language, user)
      result = Result.new
      result.user_id = user.id
      result.question_id = id
      result.language = language
      result.code = source_code
      if answer_flag
        result.answer = true
      else
        result.answer = false
      end
      result.save
    end
  end
end
