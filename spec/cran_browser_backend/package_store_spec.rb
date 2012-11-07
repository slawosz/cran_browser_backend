require 'spec_helper'

describe CranBrowserBackend::PackageStore do
  context "collected_packages" do
    before do
      p1 = CranBrowserBackend::PackageStore.create(name: 'Package 1')
      p2 = CranBrowserBackend::PackageStore.create(name: 'Package 2')

      p1.package_versions.create(version: '1.p1')
      p1.package_versions.create(version: '2.p1')

      p2.package_versions.create(version: '1.p2')
    end

    let(:collected_packages) do
      [{'Package' => 'Package 1', 'Version' => '1.p1'},
      {'Package' => 'Package 1', 'Version' => '2.p1'},
      {'Package' => 'Package 2', 'Version' => '1.p2'}]
    end

    after do
      CranBrowserBackend::PackageStore.delete_all
      CranBrowserBackend::PackageVersionStore.delete_all
    end

    it 'should be return' do
      CranBrowserBackend::PackageStore.collected_packages.should =~ collected_packages
    end
  end

  context 'update_packages' do
    let(:packages_to_update) do
      [{"Package"=>"Package 1", "Type"=>"Package", "Title"=>"Title 1", "Version"=>"v1", "Date"=>"2012-09-26", "Author"=>"Creator 1", "Maintainer"=>"Maintainer 1", "Description"=>"description 1", "License"=>"GPL 1", "Imports"=>"import 1", "LazyLoad"=>"yes", "Packaged"=>"packaged_at 1", "Repository"=>"CRAN", "Date/Publication"=>"publication date 1"},
       {"Package"=>"Package 1", "Type"=>"Package", "Title"=>"Title 2", "Version"=>"v2", "Date"=>"2012-09-26", "Author"=>"Creator 2", "Maintainer"=>"Maintainer 2", "Description"=>"description 2", "License"=>"GPL 2", "Imports"=>"import 2", "LazyLoad"=>"yes", "Packaged"=>"packaged_at 2", "Repository"=>"CRAN", "Date/Publication"=>"publication date 2"},
       {"Package"=>"Package 2", "Type"=>"Package", "Title"=>"Title 3", "Version"=>"v3", "Date"=>"2012-09-26", "Author"=>"Creator 3", "Maintainer"=>"Maintainer 3", "Description"=>"description 3", "License"=>"GPL 3", "Imports"=>"import 3", "LazyLoad"=>"yes", "Packaged"=>"packaged_at 3", "Repository"=>"CRAN", "Date/Publication"=>"publication date 3"}]
    end

    it 'should create packages' do
      CranBrowserBackend::PackageStore.update_packages(packages_to_update)

      p CranBrowserBackend::PackageStore.all
      CranBrowserBackend::PackageStore.count.should == 2
      CranBrowserBackend::PackageVersionStore.count.should == 3

      p1 = CranBrowserBackend::PackageStore.find_by_name 'Package 1'
      p2 = CranBrowserBackend::PackageStore.find_by_name 'Package 2'

      v1 = CranBrowserBackend::PackageVersionStore.find_by_version 'v1'
      v2 = CranBrowserBackend::PackageVersionStore.find_by_version 'v2'
      v3 = CranBrowserBackend::PackageVersionStore.find_by_version 'v3'

      p1.package_versions.should =~ [v1, v2]
      p2.package_versions.should =~ [v3]

      v1.package_type.should == 'Package'
      v1.title.should        == 'Title 1'
      v1.date.should         == '2012-09-26'
      v1.author.should       == 'Creator 1'
      v1.maintainer.should   == 'Maintainer 1'
      v1.description.should  == 'description 1'
      v1.license.should      == 'GPL 1'
      v1.imports.should      == 'import 1'
      v1.lazy_load.should    == 'yes'
      v1.packaged_at.should  == 'packaged_at 1'
      v1.repository.should   == 'CRAN'
      v1.publication_date.should == 'publication date 1'

      v2.package_type.should == 'Package'
      v2.title.should        == 'Title 2'
      v2.date.should         == '2012-09-26'
      v2.author.should       == 'Creator 2'
      v2.maintainer.should   == 'Maintainer 2'
      v2.description.should  == 'description 2'
      v2.license.should      == 'GPL 2'
      v2.imports.should      == 'import 2'
      v2.lazy_load.should    == 'yes'
      v2.packaged_at.should  == 'packaged_at 2'
      v2.repository.should   == 'CRAN'
      v2.publication_date.should == 'publication date 2'

      v3.package_type.should == 'Package'
      v3.title.should        == 'Title 3'
      v3.date.should         == '2012-09-26'
      v3.author.should       == 'Creator 3'
      v3.maintainer.should   == 'Maintainer 3'
      v3.description.should  == 'description 3'
      v3.license.should      == 'GPL 3'
      v3.imports.should      == 'import 3'
      v3.lazy_load.should    == 'yes'
      v3.packaged_at.should  == 'packaged_at 3'
      v3.repository.should   == 'CRAN'
      v3.publication_date.should == 'publication date 3'
    end
  end
end
