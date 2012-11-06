# encoding: UTF-8
module CranBrowserBackend
  class PackagesFetcher
    BASE_URL = "http://cran.r-project.org/src/contrib/"
    FILE_TYPE = "tar.gz"

    def self.fetch(packages_to_fetch)
      packages_to_fetch.map do |package|
        package_data = { url: BASE_URL + package["Package"] + '_' + package["Version"] + '.' + FILE_TYPE,
          file_name: package["Package"] + '_' + package["Version"] + '.' + FILE_TYPE,
          directory_name: package["Package"]}
        PackageFetcher.fetch(package_data)
      end
    end
  end
end
