require 'spec_helper'
require './lib/code_candy/code_runner'

# == 実行可能言語 ==
#
# C (gcc)
# C (clang)
# C++
# Ruby
# Python3
# Golang
# Node.js
# Java
# Scala
# Swift
# PHP
# Perl
# Bash
# Lua
# Haskell
# Pascal
# TypeScript

describe "code_runner" do
  before do
    @code_runner = CodeCandy::CodeRunner.new
  end

  context "実行したプログラムが正常に動作していること" do
    it "Gcc", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      return_prams = @code_runner.exec("gcc", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Clang", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      return_prams = @code_runner.exec("clang", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "C++", code_runner: true do
      @source_code = """
      #include<stdio.h>
        int main(void) {
          printf(\"hello\");
          return 0;
      }
      """
      return_prams = @code_runner.exec("cpp", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Ruby", code_runner: true do
      @source_code = "print \"hello\""
      return_prams = @code_runner.exec("ruby", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Python", code_runner: true do
      @source_code = "print (\"hello\")"
      return_prams = @code_runner.exec("python3", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Golang", code_runner: true do
      @source_code = """
      package main

      import \"fmt\"

      func main() {
          fmt.Println(\"hello\")
      }
      """
      return_prams = @code_runner.exec("golang", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Node.js", code_runner: true do
      @source_code = "console.log(\"hello\")"
      return_prams = @code_runner.exec("nodejs", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Java", code_runner: true do
      @source_code = """
      import java.util.*;
      public class Main {
          public static void main(String[] args) {
              System.out.println(\"hello\");
          }
      }
      """
      return_prams = @code_runner.exec("java", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Scala", code_runner: true do
      @source_code = """
      import java.util._
      object Main {
        def main(args: Array[String]) {
            println(\"hello\")
        }
      }
      """
      return_prams = @code_runner.exec("scala", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Swift", code_runner: true do
      @source_code = "print (\"hello\")"
      return_prams = @code_runner.exec("swift", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "PHP", code_runner: true do
      @source_code = """
        <?php echo \"hello\"; ?>
      """
      return_prams = @code_runner.exec("php", @source_code, "", 1)
      return_prams[:stdout] = return_prams[:stdout].lstrip.rstrip
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Perl", code_runner: true do
      @source_code = "print (\"hello\\n\")"
      return_prams = @code_runner.exec("perl", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Bash", code_runner: true do
      @source_code = "echo \"hello\""
      return_prams = @code_runner.exec("bash", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Lua", code_runner: true do
      @source_code = "print (\"hello\")"
      return_prams = @code_runner.exec("lua", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Haskell", code_runner: true do
      @source_code = "main = putStrLn \"hello\""
      return_prams = @code_runner.exec("haskell", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Pascal", code_runner: true do
      @source_code = """
      program Hello;
      begin
        writeln ('hello');
      end.
      """
      return_prams = @code_runner.exec("pascal", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "TypeScript", code_runner: true do
      @source_code = "console.log(\"hello\")"
      return_prams = @code_runner.exec("nodejs", @source_code, "", 1)
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end
end
