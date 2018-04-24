class Api::V1::CompileController < ApplicationController
  protect_from_forgery except: :exec

  def exec
=begin
# 送られてきたパラメータを変数に格納
language = params[:language]
source_code = params[:source_code]
input = params[:input]
exec_time = Time.now.to_f

# ファイルの名前を設定
source_file     = "main"
input_file      = "input"
workdir_dirname = "workspace_#{exec_time}"

case language
when 'Ruby'
  source_file += '.rb'
  exec_cmd = "ruby #{source_file}"
when 'Python'
  source_file += '.py'
  exec_cmd = "python #{source_file}"
when 'C'
  filename_id = source_file
  source_file += '.c'
  exec_cmd = "cc -Wall -o #{filename_id} #{source_file} && ./#{filename_id}"
end

logger.ingo("Creating Container")

render json: hoge
=end
  end
end
