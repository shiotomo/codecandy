# 提出されたプログラムを実行し、問題との正誤を判断するAPI
require './lib/code_candy/container'

class Api::V1::JudgementController < ApplicationController
  protect_from_forgery except: :exec

  def exec
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    id = params[:answer_id]

    # コンテナモジュールのインスタンスを生成
    container = CodeCandy::Container.new

    # 問題の標準入出力を呼び出し
    question = Question.find(id)

    # 処理の結果を格納するhash
    result = {}

    # 実行結果を保持しておくフラグ
    answer_flag = true

    question.answers.each do |answer|
      # コンテナに言語、ソースコード、標準入力を与えて提出されたプログラムを実行する
      result = container.init(language, source_code, answer.input)
      result[:stdout] = result[:stdout].force_encoding("UTF-8")

      # 標準出力改行コードを挿入する
      output = answer.output + "\n"

      # 正解だったらanswer_flagをtrueに、違う場合はfalseにしてループを抜ける
      if result[:stdout] == output || result[:stdout] == answer.output
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

    # UTF-8にencodeする
    result[:stdout] = result[:stdout].force_encoding("UTF-8")
    result[:stderr] = result[:stderr].force_encoding("UTF-8")

    render json: result
  end
end
