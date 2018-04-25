require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'

module CodeCandy
  class Container
    def init(language, source_code, input)
      exec_time = Time.noew.to_f

      source_file = 'main'
      input_file  = 'input'
      workdir     = "workspace_#{exec_time}"

      case language
      when 'Ruby'
        source_file += '.rb'
        exec_cmd = "ruby #{source_file}"
      when 'Python'
        source_file += '.py'
        exec_cmd = "ruby #{source_file}"
      when 'C'
        file_id = source_file
        source_file += '.c'
        exec_cmd = "cc- Wall -o #{file_id} #{source_file} && ./#{file_id}"
      end

      # logger.info("Creating Container")
      container = Docker::Container.create(
        Image: 'ubuntu-dev',
        WorkingDir: '/workspace',
        Memory: 512 * 1024**2,
        MemorySwap: 512 * 1024**2,
        PidsLimit: 30,
        HostConfig: {
          Binds: ["/tmp/#{workdir}:/workspace"]
        },
        Tty: true
      )
      # logger.info("Creating Container id: #{container.id}")

      # debug
      p workdir

      Open3.popen3("mkdir /tmp/#{workdir} && chmod 777 /tmp/#{workdir}") do |i, o, e, w|
        i.close
        o.each do |line|
          p line
        end
        e.each do |line|
          p line
        end
      end


      File.open("/tmp/#{workdir}/#{source_file}", "w") do |f|
        source_code.split('\n').each do |line|
          f.puts(line)
        end
      end

      File.open("/tmp/#{workdir}/#{input_file}", "w") do |f|
        input.split('\n').each do |line|
          f.puts(line)
        end
      end

      container.start
      container_cmd = "cd /workspace && /usr/bin/time -q -f \"%e\" -o /workspace/time.txt timeout 3 #{exec_cmd} < #{input}"
      res = container.exec(['bash', '-c', container_cmd])
      container.stop
      container.delete(force: true)

      proc_time = ""
      File.open("/tmp/#{workdir}/time.txt", "r") do |f|
        proc_time = f.gets + " [s]"
      end

      FileUtils.rm_r("/tmp/#{workdir}")
      content_type :json
      return_params = {stdout: res[0].join(''), stderr: res[1].join(''), time: proc_time, exit_code: res[2]}

      return_params.to_json

      return return_params
    end
  end
end
