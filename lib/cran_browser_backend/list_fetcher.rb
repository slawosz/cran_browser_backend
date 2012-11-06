module CranBrowserBackend
  class ListFetcher < Fetcher
    URL = 'http://cran.r-project.org/src/contrib/PACKAGES.gz'
    FILE = 'PACKAGES'
    ZIPPED_FILE = FILE + '.gz'

    class << self

      private

      def file_to_parse
        SANDBOX + '/' + FILE
      end

      def extract_file
        `gunzip -c #{SANDBOX}/#{ZIPPED_FILE} > #{file_to_parse}`
      end

      def url
        URL
      end

    end
  end
end
