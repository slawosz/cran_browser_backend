require 'dcf'

module CranBrowserBackend
  class ListParser
    def self.parse(path)
      file = File.read(path)
      Dcf.parse(file)
    end
  end
end
