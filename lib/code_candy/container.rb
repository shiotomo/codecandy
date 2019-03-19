# Dockerを用いて提出されたプログラムを実行するモジュール

require 'docker'
require 'docker-api'

module CodeCandy
  class Container
    class << self
      def create(exec_time, work_dir, image_name, user_id)
        container = Docker::Container.create(
          name: "test_#{exec_time}_#{user_id}",
          Image: image_name,
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
