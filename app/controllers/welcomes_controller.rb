class WelcomesController < ApplicationController
  def index
    redirect_to tops_path if user_signed_in?
    results = Result.all.order(created_at: 'desc')
    codes = Code.all.order(created_at: 'desc')
    analysis_results = CodeCandy::Analysis.statistics_result(results)
    analysis_codes = CodeCandy::Analysis.statistics_result(codes)
    analysis = analysis_results.merge(analysis_codes){|k, v1, v2| v1 + v2}
    @analysis = analysis.sort_by{|k, v| v}.reverse
  end
end
