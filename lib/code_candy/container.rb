# Dockerを用いて提出されたプログラムを実行するモジュール

require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'
require 'timeout'

module CodeCandy
  class Container
    class << self
      def create(exec_time, work_dir, language)
        case language
        when 'Swift', 'PHP'
          return swift_php(exec_time, work_dir)
        when 'Java', 'Scala'
          return jvm(exec_time, work_dir)
        else
          return default(exec_time, work_dir)
        end
      end

      private
      def default(exec_time, work_dir)
        container = Docker::Container.create(
          name: "test_#{exec_time}",
          Image: 'codecandy_compiler_default',
          WorkingDir: '/workspace',
          Memory: 512 * 1024**2,
          MemorySwap: 512 * 1024**2,
          PidsLimit: 30,
          HostConfig: {
            Binds: ["/tmp/#{work_dir}:/workspace"]
          },
          Tty: true
        )
        return container
      end

      def swift_php(exec_time, work_dir)
        container = Docker::Container.create(
          name: "test_#{exec_time}",
          Image: 'codecandy_compiler_swift_php',
          WorkingDir: '/workspace',
          Memory: 512 * 1024**2,
          MemorySwap: 512 * 1024**2,
          PidsLimit: 30,
          HostConfig: {
            Binds: ["/tmp/#{work_dir}:/workspace"]
          },
          Tty: true
        )
        return container
      end

      def jvm(exec_time, work_dir)
        container = Docker::Container.create(
          name: "test_#{exec_time}",
          Image: 'codecandy_compiler_jvm',
          WorkingDir: '/workspace',
          Memory: 512 * 1024**2,
          MemorySwap: 512 * 1024**2,
          PidsLimit: 30,
          HostConfig: {
            Binds: ["/tmp/#{work_dir}:/workspace"]
          },
          Tty: true
        )
        return container
      end
    end
  end
end
