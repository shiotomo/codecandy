require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'

module CodeCandy
  class Container
    def init(language, source_code, input)
      exec_time = Time.now.to_f

      source_file = 'main'
      input_file  = 'input'
      work_dir     = "workspace_#{exec_time}"

      case language
      when 'Ruby'
        source_file += '.rb'
        exec_cmd = "ruby #{source_file}"
      when 'Python'
        source_file += '.py'
        exec_cmd = "python #{source_file}"
      when 'C'
        filename_id = source_file
        source_file += '.c'
        exec_cmd = "cc -Wall -o #{filename_id} #{source_file} && ./#{filename_id}"
      end

      container = Docker::Container.create(
        name: "test_#{exec_time}",
        Image: 'codecandy/compile',
        WorkingDir: '/workspace',
        Memory: 512 * 1024**2,
        MemorySwap: 512 * 1024**2,
        PidsLimit: 30,
        HostConfig: {
          Binds: ["/tmp/#{work_dir}:/workspace"]
        },
        Tty: true
      )

      # debug
      p work_dir

      Open3.popen3("mkdir /tmp/#{work_dir} && chmod 777 /tmp/#{work_dir}") do |i, o, e, w| 
        i.close
        o.each do |line| p line end
        e.each do |line| p line end
      end

      File.open("/tmp/#{work_dir}/#{source_file}", "w") do |f|
        source_code.split('\n').each do |line|
          f.puts(line)
        end
      end

      File.open("/tmp/#{work_dir}/#{input_file}", "w") do |f|
        input.split('\n').each do |line|
          f.puts(line)
        end
      end

      container.start
      container_cmd = "cd /workspace && /usr/bin/time -q -f \"%e\" -o /workspace/time.txt timeout 3 #{exec_cmd} < #{input_file}" 
      res = container.exec(['bash', '-c', container_cmd])
      container.stop
      container.delete(force: true)

      p "hello"

      proc_time = ""
      File.open("/tmp/#{work_dir}/time.txt", "r") do |f|
        proc_time = f.gets
      end
      proc_time += "[s]"

      FileUtils.rm_r("/tmp/#{work_dir}")

      return_params = {stdout: res[0].join(''), stderr: res[1].join(''), time: proc_time, exit_code: res[2]}

      return return_params
    end
  end
end
