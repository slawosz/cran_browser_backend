# encoding: UTF-8
module CranBrowserBackend
  class PackageFetcher
    DESCRIPTION_FILE_NAME = 'DESCRIPTION'


    class << self
      def fetch(data)
        @data = data
        get_file
        extract_file
        read_plain_file_content
        erase_sandbox
        parse_file
      end

      private

      def get_file
        Downloader.get(@data[:url])
      end

      def extract_file
        `tar -xzf #{SANDBOX}/#{@data[:file_name]} -C #{SANDBOX}`
      end

      def read_plain_file_content
        @plain_text_data = File.read(SANDBOX + '/' + @data[:directory_name] + '/' + DESCRIPTION_FILE_NAME)
      end

      # is it safe?
      def erase_sandbox
        `rm -rf #{SANDBOX}/*`
      end

      def parse_file
        Dcf.parse(@plain_text_data)
      end
    end

  end
end
