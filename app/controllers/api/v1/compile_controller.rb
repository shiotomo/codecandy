require './lib/code_candy/container'

class Api::V1::CompileController < ApplicationController
  protect_from_forgery except: :exec

  def exec
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    input = params[:input]

    container = CodeCandy::Container.new
    puts 1
    result = container.init(language, source_code, input)

    render json: result
  end
end
