require 'iconv'
require 'dcf'
require 'fileutils'

module CranBrowserBackend
  class Fetcher
    class << self
      def fetch
        get_file
        read_file
        ignore_wrong_encoding
        erase_sandbox
        parse_file
      end

      private

      def get_file
        @packages = Downloader.get(url)
      end

      def ignore_wrong_encoding
        @file_content = Iconv.conv('ASCII//IGNORE', 'UTF8', @file_content)
      end

      def erase_sandbox
        FileUtils.rm_rf(Dir.glob(SANDBOX + '/*'))
      end

      def parse_file
        Dcf.parse(@file_content)
      end
    end

  end
end
