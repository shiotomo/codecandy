require 'spec_helper'
require './lib/code_candy/code_runner'

describe "code_runner" do
  before do
    @code_runner = CodeCandy::CodeRunner.new
  end

  context "C言語の場合" do
    it "実行したプログラムが正常に動作していること(Gcc)", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      return_prams = @code_runner.exec("gcc", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "実行したプログラムが正常に動作していること(Clang)", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      return_prams = @code_runner.exec("clang", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello"
    end
  end

  context "Rubyの場合" do
    it "実行したプログラムが正常に動作していること", code_runner: true do
      @source_code = "print \"hello\""
      return_prams = @code_runner.exec("ruby", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello"
    end
  end

  context "Python3の場合" do
    it "実行したプログラムが正常に動作していること", code_runner: true do
      @source_code = "print (\"hello\")"
      return_prams = @code_runner.exec("python3", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end

  context "Bashの場合" do
    it "実行したプログラムが正常に動作していること", code_runner: true do
      @source_code = "echo \"hello\""
      return_prams = @code_runner.exec("bash", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end

  context "Nodejsの場合" do
    it "実行したプログラムが正常に動作していること", code_runner: true do
      @source_code = "console.log(\"hello\")"
      return_prams = @code_runner.exec("nodejs", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end

  context "Luaの場合" do
    it "実行したプログラムが正常に動作していること", code_runner: true do
      @source_code = "print (\"hello\")"
      return_prams = @code_runner.exec("lua", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end
end
