require './lib/code_candy/compiler'

class Api::V1::CompileController < Api::ApiController
  def exec
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    input = params[:input]
    compiler = CodeCandy::Compiler.new

    submit_language = {
      "Gcc": "C(gcc)",
      "Clang": "C(clang)",
      "Ruby": "Ruby",
      "Python3": "Python3",
      "Golang": "Golang",
      "Nodejs": "Node.js",
      "Java": "Java",
      "Scala": "Scala",
      "Swift": "Swift",
      "CPP": "C++",
      "PHP": "PHP",
      "Perl": "Perl",
      "Bash": "Bash",
      "Lua": "Lua"
    }

    # 提出されたコードを保存
    Code.create(
      code: source_code,
      language: submit_language[:"#{language}"],
      user_id: current_user.id
    )

    result = compiler.exec(language, source_code, input)

    result[:stdout] = result[:stdout].force_encoding("UTF-8")
    result[:stderr] = result[:stderr].force_encoding("UTF-8")

    render json: result
  end
end
