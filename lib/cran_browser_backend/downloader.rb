module CranBrowserBackend
  class Downloader
    def self.get(url)
      command = "wget #{url} -P #{CranBrowserBackend::SANDBOX}"
      system(command)
    end
  end
end
