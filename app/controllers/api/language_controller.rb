require './lib/code_candy/language'

class Api::LanguageController < Api::ApiController
  before_action :authenticate_user!

  # ファイルの拡張子を返却するAPI
  def information
    language = params[:language]
    data = params[:data]
    begin
      @language_data = {
        data: CodeCandy::Language.get_language_data[:"#{language}"][:"#{data}"]
      }
    rescue
      @language_data = {
        data: nil
      }
    end
    render json: @language_data
  end
end
