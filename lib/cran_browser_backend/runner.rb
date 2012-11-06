module CranBrowserBackend
  class Runner
    def self.run
      packages_to_update = PackagesUpdater.packages_to_update_hash
    end
  end
end
