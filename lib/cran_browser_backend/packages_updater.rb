# encoding: UTF-8

module CranBrowserBackend
  class PackagesUpdater
    def self.packages_to_update_hash
      cran_packages = ListFetcher.fetch
      collected_packages = [] # TODO
      packages_to_get = PackagesFetcherResolver.packages_to_get(
        collected_packages: collected_packages,
        cran_packages: cran_packages)
      packages = PackagesFetcher.fetch(packages_to_get)
    end
  end
end
