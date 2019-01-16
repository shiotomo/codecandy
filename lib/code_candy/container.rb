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
      def create(exec_time, work_dir, language, user_id)
        case language
        when 'Swift'
          return image(exec_time, work_dir, user_id, 'codecandy_compiler_swift')
        when 'Java', 'Scala', 'PHP'
          return image(exec_time, work_dir, user_id, 'codecandy_compiler_jvm_php')
        else
          return image(exec_time, work_dir, user_id, 'codecandy_compiler_default')
        end
      end

      private
      def image(exec_time, work_dir, user_id, image_name)
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
