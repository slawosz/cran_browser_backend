require 'spec_helper'

describe CranBrowserBackend::PackagesUpdater do

  let(:sandbox_path) { CranBrowserBackend::ROOT + '/spec/sandbox' }

  let(:real_packages) {
    require 'open-uri'
    Dcf.parse(open('http://cran.r-project.org/src/contrib/PACKAGES').read).map do |package|
      package['Package']
    end
  }
  before do
    stub_const("CranBrowserBackend::SANDBOX", sandbox_path)
  end

  it 'should work' do
    packages_to_update = CranBrowserBackend::PackagesUpdater.packages_to_update_hash

    package_to_update.map! {|package| package['Package']}.should == real_packages
  end
end
