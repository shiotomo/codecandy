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
          "Lua": "Lua"
        }
        return submit_language[:"#{language}"]
      end
    end
  end
end
