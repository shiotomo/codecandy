require 'spec_helper'
require './lib/code_candy/judgement'

describe "judgement" do
  before do
    @uesr = create(:user, id: 1)
    @question = create(:question, id: 1)
    @question.answers.create(
      input: 'hello',
      output: 'hello'
    )
  end

  context "実行したプログラムが正解になること" do
    it "Ruby", code_runner: true do
      @source_code = "a = gets \n print a"
      judgement = CodeCandy::Judgement.new("ruby", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end
  end
end
