module CranBrowserBackend
  class ListFetcher < Fetcher
    URL = 'http://cran.r-project.org/src/contrib/PACKAGES.gz'
    FILE = 'PACKAGES'
    ZIPPED_FILE = FILE + '.gz'

    class << self

      private

      def read_file
        @file_content = Zlib::GzipReader.new(File.new(File.expand_path(ZIPPED_FILE, SANDBOX))).read
      end

      def url
        URL
      end

    end
  end
end
