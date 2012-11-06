module CranBrowserBackend
  class PackagesFetcherResolver

    def self.packages_to_get(packages_data)
      collected_packages = packages_data[:collected_packages]
      cran_packages      = packages_data[:cran_packages]
      (cran_packages.to_set - collected_packages.to_set).to_a
    end
  end
end
