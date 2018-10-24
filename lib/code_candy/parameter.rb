module CodeCandy
  class Parameter
    class << self
      def get_submit_language(language)
        submit_language = {
          "Gcc": "C(gcc)",
          "Clang": "C(clang)",
          "Ruby": "Ruby",
          "Python3": "Python3",
          "Golang": "Golang",
          "Nodejs": "Node.js",
          "Java": "Java",
          "Scala": "Scala",
          "Swift": "Swift",
          "CPP": "C++",
          "PHP": "PHP",
          "Perl": "Perl",
          "Bash": "Bash",
          "Lua": "Lua",
          "Haskell": "Haskell"
        }
        return submit_language[:"#{language}"]
      end

      def get_exec_data
        exec_data = {
          "Ruby":    Ruby.new,
          "Python3": Python3.new,
          "Gcc":     Gcc.new,
          "Clang":   Clang.new,
          "Golang":  Golang.new,
          "Nodejs":  Nodejs.new,
          "Java":    Java.new,
          "Scala":   Scala.new,
          "Swift":   Swift.new,
          "CPP":     CPP.new,
          "PHP":     PHP.new,
          "Perl":    Perl.new,
          "Bash":    Bash.new,
          "Lua":     Lua.new,
          "Haskell": Haskell.new
        }
        return exec_data
      end
    end
  end
end
