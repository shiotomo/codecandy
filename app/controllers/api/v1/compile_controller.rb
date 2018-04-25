require './lib/code_candy/container'

class Api::V1::CompileController < ApplicationController
  protect_from_forgery except: :exec

  def exec
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    input = params[:input]

    puts "============>"
    p source_code.encoding
    # source_code.force_encoding("ASCII-8BIT")
    p source_code.encoding

    container = CodeCandy::Container.new
    puts 1
    result = container.init(language, source_code, input)

    p result
    result[:stdout] = result[:stdout].force_encoding("UTF-8")

    render json: result
  end
end
