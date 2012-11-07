module CranBrowserBackend
  class PackageVersionStore < ActiveRecord::Base
    self.table_name = 'package_versions'

    #keys = [:type, :title, :version, :date, :author, :maintainer,
    #  :description, :license, :imports, :lazyload, :packaged, :repository,
    #  :"publication_date"]
    belongs_to :package, class_name: 'PackageStore'
  end
end
