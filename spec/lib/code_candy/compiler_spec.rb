require 'spec_helper'
require './lib/code_candy/compiler'

describe "Compiler" do
  context "C言語の場合" do
    before do
      @compiler = CodeCandy::Compiler.new
      @source_code = "main() { printf(\"hello\"); }"
    end

    it "実行したプログラムが正常に動作していること(Gcc)" do
      return_prams = @compiler.exec("Gcc", @source_code, "")
      expect(return_prams[:stdout]).to eq 'hello'
    end

    it "実行したプログラムが正常に動作していること(Gcc)" do
      return_prams = @compiler.exec("Clang", @source_code, "")
      expect(return_prams[:stdout]).to eq 'hello'
    end
  end
end
