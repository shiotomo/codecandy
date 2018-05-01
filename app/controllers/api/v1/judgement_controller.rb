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
      result = container.init(language, source_code, answer.input)
      result[:stdout] = result[:stdout].force_encoding("UTF-8")

      output = answer.output + "\n"

      if result[:stdout] == output || result[:stdout] == answer.output
        answer_flag = true
      else
        answer_flag = false
        break
      end
    end

    if answer_flag
      result[:answer] = "正解"
    else
      result[:answer] = "不正解"
    end

    render json: result
  end
end
