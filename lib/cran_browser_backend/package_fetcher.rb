# encoding: UTF-8
module CranBrowserBackend
  class PackageFetcher < Fetcher
    DESCRIPTION_FILE_NAME = 'DESCRIPTION'


    class << self
      def fetch(data)
        @data = data
        super()
      end

      private

      def url
        @data[:url]
      end

      def file_to_parse
        SANDBOX + '/' + @data[:directory_name] + '/' + DESCRIPTION_FILE_NAME
      end

      def file_to_extract
        SANDBOX + '/' + @data[:file_name]
      end

      def extract_file
        `tar -xzf #{file_to_extract} -C #{SANDBOX}`
      end
    end

  end
end
