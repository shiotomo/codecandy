module CodeCandy
  class Language
    def initialize
      @cmd_data = {
        "exec_file": "main",
        "source_file": "main",
        "exec_cmd": "",
        "time_out": 5
      }
    end
  end

  class Ruby < Language
    def cmd
      @cmd_data[:source_file] += ".rb"
      @cmd_data[:exec_cmd] = "ruby #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Python3 < Language
    def cmd
      @cmd_data[:source_file] += ".py"
      @cmd_data[:exec_cmd] = "python #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Gcc < Language
    def cmd
      @cmd_data[:source_file] += ".c"
      @cmd_data[:exec_cmd] = "gcc -o #{@cmd_data[:exec_file]} #{@cmd_data[:source_file]} && ./#{@cmd_data[:exec_file]}"
      return @cmd_data
    end
  end

  class Clang < Language
    def cmd
      @cmd_data[:source_file] += ".c"
      @cmd_data[:exec_cmd] = "cc -Wall -o #{@cmd_data[:exec_file]} #{@cmd_data[:source_file]} && ./#{@cmd_data[:exec_file]}"
      return @cmd_data
    end
  end

  class Golang < Language
    def cmd
      @cmd_data[:source_file] += ".go"
      @cmd_data[:exec_cmd] = "go run #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Nodejs < Language
    def cmd
      @cmd_data[:source_file] += ".js"
      @cmd_data[:exec_cmd] = "nodejs #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Java < Language
    def cmd
      @cmd_data[:time_out] = 10
      @cmd_data[:exec_file] = "Main"
      @cmd_data[:source_file] = "Main.java"
      @cmd_data[:exec_cmd] = "javac #{@cmd_data[:source_file]} && java #{@cmd_data[:exec_file]}"
      return @cmd_data
    end
  end

  class Scala < Language
    def cmd
      @cmd_data[:time_out] = 20
      @cmd_data[:exec_file] = "Main"
      @cmd_data[:source_file] = "Main.scala"
      @cmd_data[:exec_cmd] = "scalac #{@cmd_data[:source_file]} && scala #{@cmd_data[:exec_file]}"
      return @cmd_data
    end
  end

  class Swift < Language
    def cmd
      @cmd_data[:source_file] += ".swift"
      @cmd_data[:exec_cmd] = "swift #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class CPP < Language
    def cmd
      @cmd_data[:source_file] += ".cpp"
      @cmd_data[:exec_cmd] = "g++ -o #{@cmd_data["exec_file"]} #{@cmd_data[:source_file]} && ./#{@cmd_data[:exec_file]}"
      return @cmd_data
    end
  end

  class PHP < Language
    def cmd
      @cmd_data[:source_file] += ".php"
      @cmd_data[:exec_cmd] = "php #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Perl < Language
    def cmd
      @cmd_data[:source_file] += ".pl"
      @cmd_data[:exec_cmd] = "perl #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Bash < Language
    def cmd
      @cmd_data[:source_file] += ".sh"
      @cmd_data[:exec_cmd] = "bash #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Lua < Language
    def cmd
      @cmd_data[:source_file] += ".lua"
      @cmd_data[:exec_cmd] = "lua5.3 #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Haskell < Language
    def cmd
      @cmd_data[:source_file] += ".hs"
      @cmd_data[:exec_cmd] = "runghc #{@cmd_data[:source_file]}"
      return @cmd_data
    end
  end

  class Pascal < Language
    def cmd
      @cmd_data[:source_file] += ".pas"
      @cmd_data[:exec_cmd] = "fpc #{@cmd_data[:source_file]} > /dev/null 2>&1 && ./#{@cmd_data[:exec_file]}"
      return @cmd_data
    end
  end
end
