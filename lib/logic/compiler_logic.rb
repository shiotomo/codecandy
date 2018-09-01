class CompilerLogic
  # 実行準備を行う
  # container プログラムを動かすコンテナ
  # data source_code, input_file, work_dir, input_content, cmdの入ったHash
  def initialize(container, data)
    @source_code = data[:source_code]
    @input_file = data[:input_file]
    @work_dir =  data[:work_dir]
    @input = data[:input_content]
    @cmd = data[:cmd]
    @container = container

    # Open3を利用してディレクトリを作成＆権限の変更
    Open3.popen3("mkdir /tmp/#{@work_dir} && chmod 777 /tmp/#{@work_dir}") do |i, o, e|
      i.close
      o.each do |line| p line end
      e.each do |line| p line end
    end

    # プログラムのファイルの作成
    File.open("/tmp/#{@work_dir}/#{@cmd[:source_file]}", "w") do |f|
      @source_code.each_line do |line|
        f.puts(line)
      end
    end

    # 標準入力用のファイルの作成
    File.open("/tmp/#{@work_dir}/#{@input_file}", "w") do |f|
      @input.each_line do |line|
        f.puts(line)
      end
    end
  end

  # 引数
  # language: どの言語で動かすプログラムなのかを格納してある
  # source_code: 実行するプログラムが格納されている
  # input: 標準入力に使う値が格納されている
  # 返り値
  # return_params
  def exec
    return_params = {}

    begin
      Timeout.timeout(@cmd[:time_out]) do
        # === 実行ここから ===
        @container.start
        container_cmd = "cd /workspace && /usr/bin/time -q -f \"%e\" -o /workspace/time.txt timeout #{@cmd[:time_out]} #{@cmd[:exec_cmd]} < #{@input_file}"
        res = @container.exec(['bash', '-c', container_cmd])
        @container.stop
        @container.delete(force: true)
        # === 実行ここまで ===

        # 実行にかかった時間をproc_timeに格納
        proc_time = ""
        File.open("/tmp/#{@work_dir}/time.txt", "r") do |f|
          proc_time = f.gets.chomp
        end
        proc_time += "[s]"

        # 作業ディレクトリを削除
        FileUtils.rm_r("/tmp/#{@work_dir}")

        # 実行結果を格納
        return_params = {stdout: res[0].join(''), stderr: res[1].join(''), time: proc_time, exit_code: res[2]}
      end
    rescue Timeout::Error
      @container.stop
      @container.delete(force: true)
      return_params = {stdout: "Time out!",stderr: "Time out!", time: "", exit_code: 408}
    end

    return return_params
  end
end
