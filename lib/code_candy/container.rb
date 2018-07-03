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
      def create_openjdk10(exec_time, work_dir)
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

        return container
      end

      # まだ使用しない
      def create_ubuntu(exec_time, work_dir)
        container = Docker::Container.create(
          name: "test_#{exec_time}",
          Image: 'codecandy/ubuntu-compile',
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
