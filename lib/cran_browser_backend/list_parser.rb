require 'dcf'

module CranBrowserBackend
  class ListParser
    def self.parse(data)
      Dcf.parse(data)
    end
  end
end
