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
  context "実行したプログラムが正常に動作していること" do
    it "Gcc", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      @code_runner = CodeCandy::CodeRunner.new("gcc", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Clang", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      @code_runner = CodeCandy::CodeRunner.new("clang", @source_code, "", 1)
      return_prams = @code_runner.exec
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
      @code_runner = CodeCandy::CodeRunner.new("cpp", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Ruby", code_runner: true do
      @source_code = "print \"hello\""
      @code_runner = CodeCandy::CodeRunner.new("ruby", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Python", code_runner: true do
      @source_code = "print (\"hello\")"
      @code_runner = CodeCandy::CodeRunner.new("python3", @source_code, "", 1)
      return_prams = @code_runner.exec
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
      @code_runner = CodeCandy::CodeRunner.new("golang", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Node.js", code_runner: true do
      @source_code = "console.log(\"hello\")"
      @code_runner = CodeCandy::CodeRunner.new("nodejs", @source_code, "", 1)
      return_prams = @code_runner.exec
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
      @code_runner = CodeCandy::CodeRunner.new("java", @source_code, "", 1)
      return_prams = @code_runner.exec
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
      @code_runner = CodeCandy::CodeRunner.new("scala", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Swift", code_runner: true do
      @source_code = "print (\"hello\")"
      @code_runner = CodeCandy::CodeRunner.new("swift", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "PHP", code_runner: true do
      @source_code = """
        <?php echo \"hello\"; ?>
      """
      @code_runner = CodeCandy::CodeRunner.new("php", @source_code, "", 1)
      return_prams = @code_runner.exec
      return_prams[:stdout] = return_prams[:stdout].lstrip.rstrip
      expect(return_prams[:stdout]).to eq "hello"
    end

    it "Perl", code_runner: true do
      @source_code = "print (\"hello\\n\")"
      @code_runner = CodeCandy::CodeRunner.new("perl", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Bash", code_runner: true do
      @source_code = "echo \"hello\""
      @code_runner = CodeCandy::CodeRunner.new("bash", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Lua", code_runner: true do
      @source_code = "print (\"hello\")"
      @code_runner = CodeCandy::CodeRunner.new("lua", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Haskell", code_runner: true do
      @source_code = "main = putStrLn \"hello\""
      @code_runner = CodeCandy::CodeRunner.new("haskell", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "Pascal", code_runner: true do
      @source_code = """
      program Hello;
      begin
        writeln ('hello');
      end.
      """
      @code_runner = CodeCandy::CodeRunner.new("pascal", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end

    it "TypeScript", code_runner: true do
      @source_code = "console.log(\"hello\")"
      @code_runner = CodeCandy::CodeRunner.new("nodejs", @source_code, "", 1)
      return_prams = @code_runner.exec
      expect(return_prams[:stdout]).to eq "hello\n"
    end
  end
end
