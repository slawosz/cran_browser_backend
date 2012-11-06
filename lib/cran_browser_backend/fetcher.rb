require 'iconv'
require 'dcf'

module CranBrowserBackend
  class Fetcher
    class << self
      def fetch
        get_file
        extract_file
        read_plain_file_content
        erase_sandbox
        parse_file
      end

      private

      def get_file
        @packages = Downloader.get(url)
      end

      def read_plain_file_content
        @plain_text_data = File.read(file_to_parse)
        @plain_text_data = Iconv.conv('ASCII//IGNORE', 'UTF8', @plain_text_data)
      end

      def erase_sandbox
        `rm -rf #{SANDBOX}/*`
      end

      def parse_file
        Dcf.parse(@plain_text_data)
      end
    end

  end
end
