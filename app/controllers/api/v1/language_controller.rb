require './lib/code_candy/language'

class Api::AdminController < Api::ApiController
  before_action :authenticate_user!

  # ファイルの拡張子を返却するAPI
  def extension
    language = params[:language]
    return CodeCandy::Language.get_language_data[:"#{language}"][:extension]
  end

  # タブサイズを返却するAPI
  def tab
    language = params[:language]
    return CodeCandy::Language.get_language_data[:"#{language}"][:tab]
  end
end
