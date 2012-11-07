module CranBrowserBackend
  class PackageStore < ActiveRecord::Base
    self.table_name = 'packages'

    has_many :package_versions, class_name: 'PackageVersionStore', foreign_key: 'package_id'

    def self.collected_packages
      select('name, version').joins(:package_versions).map do |package|
        {'Package' => package.name, 'Version' => package.version}
      end
    end

    def self.update_packages(packages_to_update)
      packages_to_update.each do |p|
        package = find_or_create_by_name p["Package"]
        version_data = {
          package_type: p["Type"],
          title: p["Title"],
          version: p["Version"],
          date: p["Date"],
          author: p["Author"],
          maintainer: p["Maintainer"],
          description: p["Description"],
          license: p["License"],
          imports: p["Imports"],
          depends: p["Depends"],
          suggests: p["Suggests"],
          lazy_load: p["LazyLoad"],
          packaged_at: p["Packaged"],
          repository: p["Repository"],
          publication_date: p["Date/Publication"]
        }
        package.package_versions.create(version_data)
      end
    end
  end
end
