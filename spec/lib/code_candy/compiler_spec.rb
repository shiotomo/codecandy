require 'spec_helper'
require './lib/code_candy/compiler'

describe "Compiler" do
  before do
    @compiler = CodeCandy::Compiler.new
  end

  context "C言語の場合" do
    it "実行したプログラムが正常に動作していること(Gcc)", compiler: true do
      @source_code = "main() { printf(\"hello\"); }"
      return_prams = @compiler.exec("Gcc", @source_code, "")
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "実行したプログラムが正常に動作していること(Gcc)", compiler: true do
      @source_code = "main() { printf(\"hello\"); }"
      return_prams = @compiler.exec("Clang", @source_code, "")
      expect(return_prams[:stdout]).to eq "hello"
    end
  end

  context "Rubyの場合" do
    it "実行したプログラムが正常に動作していること", compiler: true do
      @source_code = "print \"hello\""
      return_prams = @compiler.exec("Ruby", @source_code, "")
      expect(return_prams[:stdout]).to eq "hello"
    end
  end

  context "Python3の場合" do
    it "実行したプログラムが正常に動作していること", compiler: true do
      @source_code = "print (\"hello\")"
      return_prams = @compiler.exec("Python3", @source_code, "")
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end

  context "Bashの場合" do
    it "実行したプログラムが正常に動作していること", compiler: true do
      @source_code = "echo \"hello\""
      return_prams = @compiler.exec("Bash", @source_code, "")
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end

  context "Nodejsの場合" do
    it "実行したプログラムが正常に動作していること", compiler: true do
      @source_code = "console.log(\"hello\")"
      return_prams = @compiler.exec("Nodejs", @source_code, "")
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end

  context "Luaの場合" do
    it "実行したプログラムが正常に動作していること", compiler: true do
      @source_code = "print (\"hello\")"
      return_prams = @compiler.exec("Lua", @source_code, "")
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end
end
