class Api::V1::CompileController < ApplicationController
  protect_from_forgery except: :exec

  def exec
    puts "==============>"
    puts "hogehoge"
    puts "==============>"
    hoge = {"stdout": "hoge", "stderr": "piyo", "stdtime": 1, "exit_code": 0}
    language = params[:language]
    source_code = params[:source_code]
    input = params[:input]
    exec_time = Time.now.to_f
    puts language
    puts source_code
    puts input


    render json: hoge
  end
end
