require 'spec_helper'
require './lib/code_candy/judgement'

describe "judgement" do
  before do
    @uesr = create(:user, id: 1)
    @question = create(:question, id: 1)
    @question.answers.create(
      input: '',
      output: 'hello'
    )
  end

  context "実行したプログラムが正解になること" do
    it "Gcc", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      judgement = CodeCandy::Judgement.new("gcc", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Clang", code_runner: true do
      @source_code = "main() { printf(\"hello\"); }"
      judgement = CodeCandy::Judgement.new("clang", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "C++", code_runner: true do
      @source_code = """
      #include<stdio.h>
      int main(void) {
          printf(\"hello\");
          return 0;
      }
      """
      judgement = CodeCandy::Judgement.new("cpp", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Ruby", code_runner: true do
      @source_code = "print 'hello'"
      judgement = CodeCandy::Judgement.new("ruby", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Python", code_runner: true do
      @source_code = "print (\"hello\")"
      judgement = CodeCandy::Judgement.new("python3", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Golang", code_runner: true do
      @source_code = """
      package main

      import \"fmt\"

      func main() {
          fmt.Println(\"hello\")
      }
      """
      judgement = CodeCandy::Judgement.new("golang", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Node.js", code_runner: true do
      @source_code = "console.log(\"hello\")"
      judgement = CodeCandy::Judgement.new("nodejs", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
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
      judgement = CodeCandy::Judgement.new("java", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
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
      judgement = CodeCandy::Judgement.new("scala", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Swift", code_runner: true do
      @source_code = "print (\"hello\")"
      judgement = CodeCandy::Judgement.new("swift", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    # TODO フロントエンドからの検証テストでは正常に動作しているがテストコードではエラーが発生するので修正する必要性がある
    # it "PHP", code_runner: true do
    #   @source_code = """
    #     <?php echo \"hello\"; ?>
    #   """
    #   judgement = CodeCandy::Judgement.new("php", @source_code, 1, 1)
    #   result = judgement.exec
    #   expect(result[:answer]).to eq "正解"
    # end

    it "Perl", code_runner: true do
      @source_code = "print (\"hello\\n\")"
      judgement = CodeCandy::Judgement.new("perl", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Bash", code_runner: true do
      @source_code = "echo \"hello\""
      judgement = CodeCandy::Judgement.new("bash", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Lua", code_runner: true do
      @source_code = "print (\"hello\")"
      judgement = CodeCandy::Judgement.new("lua", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Haskell", code_runner: true do
      @source_code = "main = putStrLn \"hello\""
      judgement = CodeCandy::Judgement.new("haskell", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "Pascal", code_runner: true do
      @source_code = """
      program Hello;
      begin
        writeln ('hello');
      end.
      """
      judgement = CodeCandy::Judgement.new("pascal", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end

    it "TypeScript", code_runner: true do
      @source_code = "console.log(\"hello\")"
      judgement = CodeCandy::Judgement.new("typescript", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "正解"
    end
  end

  context "実行したプログラムが不正解になること" do
    it "Gcc", code_runner: true do
      @source_code = "main() { printf(\"hello11\"); }"
      judgement = CodeCandy::Judgement.new("gcc", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Clang", code_runner: true do
      @source_code = "main() { printf(\"hello11\"); }"
      judgement = CodeCandy::Judgement.new("clang", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "C++", code_runner: true do
      @source_code = """
      #include<stdio.h>
      int main(void) {
          printf(\"hello11\");
          return 0;
      }
      """
      judgement = CodeCandy::Judgement.new("cpp", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Ruby", code_runner: true do
      @source_code = "print 'hello11'"
      judgement = CodeCandy::Judgement.new("ruby", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Python", code_runner: true do
      @source_code = "print (\"hello11\")"
      judgement = CodeCandy::Judgement.new("python3", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Golang", code_runner: true do
      @source_code = """
      package main

      import \"fmt\"

      func main() {
          fmt.Println(\"hello11\")
      }
      """
      judgement = CodeCandy::Judgement.new("golang", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Node.js", code_runner: true do
      @source_code = "console.log(\"hello11\")"
      judgement = CodeCandy::Judgement.new("nodejs", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Java", code_runner: true do
      @source_code = """
      import java.util.*;
      public class Main {
          public static void main(String[] args) {
              System.out.println(\"hello11\");
          }
      }
      """
      judgement = CodeCandy::Judgement.new("java", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Scala", code_runner: true do
      @source_code = """
      import java.util._
      object Main {
        def main(args: Array[String]) {
            println(\"hello11\")
        }
      }
      """
      judgement = CodeCandy::Judgement.new("scala", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Swift", code_runner: true do
      @source_code = "print (\"hello11\")"
      judgement = CodeCandy::Judgement.new("swift", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "PHP", code_runner: true do
      @source_code = """
        <?php echo \"hello11\"; ?>
      """
      judgement = CodeCandy::Judgement.new("php", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Perl", code_runner: true do
      @source_code = "print (\"hello11\\n\")"
      judgement = CodeCandy::Judgement.new("perl", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Bash", code_runner: true do
      @source_code = "echo \"hello11\""
      judgement = CodeCandy::Judgement.new("bash", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Lua", code_runner: true do
      @source_code = "print (\"hello11\")"
      judgement = CodeCandy::Judgement.new("lua", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Haskell", code_runner: true do
      @source_code = "main = putStrLn \"hello11\""
      judgement = CodeCandy::Judgement.new("haskell", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "Pascal", code_runner: true do
      @source_code = """
      program Hello;
      begin
        writeln ('hello11');
      end.
      """
      judgement = CodeCandy::Judgement.new("pascal", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end

    it "TypeScript", code_runner: true do
      @source_code = "console.log(\"hello11\")"
      judgement = CodeCandy::Judgement.new("typescript", @source_code, 1, 1)
      result = judgement.exec
      expect(result[:answer]).to eq "不正解"
    end
  end
end
