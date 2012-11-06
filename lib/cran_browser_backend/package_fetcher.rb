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

      def file_to_extract
        File.expand_path(@data[:file_name], SANDBOX)
      end

      def read_file
        gunzipped = Zlib::GzipReader.new(File.new(file_to_extract))
        tar_reader = Gem::Package::TarReader.new(gunzipped)
        tar_reader.extend Enumerable

        @file_content = tar_reader.find do |entry|
          File.basename(entry.full_name) == DESCRIPTION_FILE_NAME
        end.read
      end
    end

  end
end
