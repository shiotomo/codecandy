module CodeCandy
  class Language
    class << self
      def get_language_data
        language_data = {
          gcc: {
            language: 'C(gcc)',
            mode: 'c_cpp',
            tab: 4,
            extension: 'c',
            source_file: 'main.c',
            exec_cmd: 'gcc -o main main.c && ./main',
            time_out: 5
          },
          clang: {
            language: 'C(clang)',
            mode: 'c_cpp',
            tab: 4,
            extension: 'c',
            source_file: 'main.c',
            exec_cmd: 'cc -Wall -o main main.c && ./main',
            time_out: 5
          },
          ruby: {
            language: 'Ruby',
            mode: 'ruby',
            tab: 2,
            extension: 'rb',
            source_file: 'main.rb',
            exec_cmd: 'ruby main.rb',
            time_out: 5
          },
          python3: {
            language: 'Python3',
            mode: 'python',
            tab: 4,
            extension: 'py',
            source_file: 'main.py',
            exec_cmd: 'python main.py',
            time_out: 5
          },
          golang: {
            language: 'Golang',
            mode: 'golang',
            tab: 4,
            extension: 'go',
            source_file: 'main.go',
            exec_cmd: 'go run main.go',
            time_out: 5
          },
          nodejs: {
            language: 'Node.js',
            mode: 'javascript',
            tab: 2,
            extension: 'js',
            source_file: 'main.js',
            exec_cmd: 'nodejs main.js',
            time_out: 5
          },
          java: {
            language: 'Java',
            mode: 'java',
            tab: 4,
            extension: 'java',
            source_file: 'Main.java',
            exec_cmd: 'javac Main.java && java Main',
            time_out: 10
          },
          scala: {
            language: 'Scala',
            mode: 'scala',
            tab: 2,
            extension: 'scala',
            source_file: 'Main.scala',
            exec_cmd: 'scalac Main.scala && scala Main',
            time_out: 20
          },
          swift: {
            language: 'Swift',
            mode: 'swift',
            tab: 4,
            extension: 'swift',
            source_file: 'main.swift',
            exec_cmd: 'swift main.swift',
            time_out: 5
          },
          cpp: {
            language: 'C++',
            mode: 'c_cpp',
            tab: 4,
            extension: 'cpp',
            source_file: 'main.cpp',
            exec_cmd: 'g++ -o main main.cpp && ./main',
            time_out: 5
          },
          php: {
            language: 'PHP',
            mode: 'php',
            tab: 4,
            extension: 'php',
            source_file: 'main.php',
            exec_cmd: 'php main.php',
            time_out: 5
          },
          perl: {
            language: 'Perl',
            mode: 'perl',
            tab: 4,
            extension: 'pl',
            source_file: 'main.pl',
            exec_cmd: 'perl main.pl',
            time_out: 5
          },
          bash: {
            language: 'Bash',
            mode: 'sh',
            tab: 2,
            extension: 'sh',
            source_file: 'main.sh',
            exec_cmd: 'bash main.sh',
            time_out: 5
          },
          lua: {
            language: 'Lua',
            mode: 'lua',
            tab: 2,
            extension: 'lua',
            source_file: 'main.lua',
            exec_cmd: 'lua5.3 main.lua',
            time_out: 5
          },
          haskell: {
            language: 'Haskell',
            mode: 'haskell',
            tab: 4,
            extension: 'hs',
            source_file: 'main.hs',
            exec_cmd: ' runghc main.hs',
            time_out: 5
          },
          pascal: {
            language: 'Pascal',
            mode: 'pascal',
            tab: 2,
            extension: 'pas',
            source_file: 'main.pas',
            exec_cmd: ' fpc main.pas > /dev/null 2>&1 && ./main',
            time_out: 5
          }
        }
        return language_data
      end
    end
  end
end
