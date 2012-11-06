module CranBrowserBackend
  class ListFetcher
    URL = 'http://cran.r-project.org/src/contrib/PACKAGES.gz'
    FILE = 'PACKAGES'
    ZIPPED_FILE = FILE + '.gz'

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
        @packages = Downloader.get(URL)
      end

      def extract_file
        `gunzip -c #{SANDBOX}/#{ZIPPED_FILE} > #{SANDBOX}/#{FILE}`
      end

      def read_plain_file_content
        @plain_text_data = File.read(SANDBOX + '/' + FILE)
      end

      # is it safe?
      def erase_sandbox
        `rm -rf #{SANDBOX}/*`
      end

      def parse_file
        ListParser.parse(@plain_text_data)
      end
    end

  end
end
