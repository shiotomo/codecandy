# 提出されたプログラムを実行し、問題との正誤を判断するAPI
require './lib/code_candy/compiler'

class Api::V1::JudgementController < ApplicationController
  protect_from_forgery except: :exec

  def exec
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    id = params[:answer_id]

    # コンテナモジュールのインスタンスを生成
    compiler = CodeCandy::Compiler.new

    # 問題の標準入出力を呼び出し
    question = Question.find(id)

    # 処理の結果を格納するhash
    result = {}

    # 実行結果を保持しておくフラグ
    answer_flag = true

    question.answers.each do |answer|
      # コンテナに言語、ソースコード、標準入力を与えて提出されたプログラムを実行する
      result = compiler.exec(language, source_code, answer.input)
      result[:stdout] = result[:stdout].force_encoding("UTF-8")

      # 標準出力の整形
      # 提出コードの標準出力: stdout
      # 提出コードの標準出力は行末の空白、改行を削除する
      # 解答用の標準出力:output
      # 解答用の標準出力は行末の空白、改行を削除する
      output = answer.output
      output = output.gsub(/\r/, "")
      output = output.gsub(/\s+$/, "").rstrip
      # stdout = result[:stdout].gsub(/(^(?!\n).*$)(\s+$)/, "\n").rstrip
      # stdout = result[:stdout].gsub(/((^\n)|(\s+$))/, "\n").rstrip
      stdout = result[:stdout].rstrip

      # == debug ==
      # puts "============"
      # pp answer.output
      # pp result[:stdout]
      # puts "------------"
      # p answer.output
      # p result[:stdout]
      # puts "------------"
      # puts output
      # puts stdout
      # p output
      # p stdout
      # puts "------------"
      # pp output
      # pp stdout
      # puts "============"

      # 正解だったらanswer_flagをtrueに、違う場合はfalseにしてループを抜ける
      if stdout == output
        answer_flag = true
      else
        answer_flag = false
        break
      end
    end

    # result[:answer]に結果を格納する
    if answer_flag
      result[:answer] = "正解"
    else
      result[:answer] = "不正解"
    end

    # resultメソッドを呼び出す
    result_submit(answer_flag, id, source_code, language)

    # UTF-8にencodeする
    result[:stdout] = result[:stdout].force_encoding("UTF-8")
    result[:stderr] = result[:stderr].force_encoding("UTF-8")

    render json: result
  end

  private
  # 結果を保存するメソッド
  def result_submit(answer_flag, id, source_code, language)
    @result = Result.new
    @result.user_id = current_user.id
    @result.question_id = id
    @result.language = submit_language(language)
    @result.code = source_code
    if answer_flag
      @result.answer = true
    else
      @result.answer = false
    end
    @result.save
  end

  def submit_language(language)
    case language
    when 'Gcc'
      return 'C(gcc)'
    when 'Clang'
      return 'C(clang)'
    when 'Ruby'
      return 'Ruby'
    when 'Python3'
      return 'Python3'
    when 'Golang'
      return 'Golang'
    when 'Nodejs'
      return 'Nodejs'
    when 'Java'
      return 'Java'
    when 'Scala'
      return 'Scala'
    else
      return ''
    end
  end
end
