require './lib/code_candy/code_runner'
require './lib/code_candy/language'

module CodeCandy
  class Judgement
    def initialize(language, source_code, question_id, user_id)
      # 送られてきたパラメータを変数に格納
      @language = language
      @question_id = question_id
      @source_code = source_code
      @user_id = user_id

      # 問題の標準入出力を呼び出し
      @answers = Question.find(@question_id).answers

      # 実行結果を保持しておくフラグ
      @answer_flag = true

      begin
        @submit_language = CodeCandy::Language.get_language_data[:"#{@language}"][:language]
      rescue
        @submit_language = ''
      end
    end

    def exec
      @answers.each do |answer|
        # コンテナモジュールのインスタンスを生成
        @code_runner = CodeCandy::CodeRunner.new(@language, @source_code, answer.input, @user_id)

        # インスタンスに言語、ソースコード、標準入力、ユーザIDを与えて提出されたプログラムを実行する
        @result = @code_runner.exec

        # 不正な入力があった場合その時点でエラーメッセージを返却する
        # answerを''にしておくことでブラウザ上でundefinedを表示しないようにする
        if @result[:input_error]
          @result[:answer] = ''
          return @result
        end

        @result[:stdout] = @result[:stdout].force_encoding("UTF-8")
        # 標準出力の整形
        # 提出コードの標準出力: stdout
        # 提出コードの標準出力は行末の空白、改行を削除する
        # 解答用の標準出力:output
        # 解答用の標準出力は行末の空白、改行を削除する
        # TODO Ruby2.6からString#Splitの仕様が変わったのでその技術を使うか検討する
        output = answer.output
        output = output.gsub(/\r/, "")
        output = output.gsub(/\s+$/, "").rstrip
        stdout = @result[:stdout].rstrip

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
        @result[:answer] = '正解'
      else
        @result[:answer] = '不正解'
      end

      # 解答データを保存
      # TODO ここの処理自体をモデルに移行することを検討する
      Result.create(
        question_id: @question_id,
        user_id: @user_id,
        language: @submit_language,
        code: @source_code,
        answer: @answer_flag
      )

      # UTF-8にencodeする
      @result[:stdout] = @result[:stdout].force_encoding("UTF-8")
      @result[:stderr] = @result[:stderr].force_encoding("UTF-8")

      return @result
    end
  end
end
