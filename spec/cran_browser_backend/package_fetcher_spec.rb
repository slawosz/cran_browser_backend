require 'spec_helper'

describe CranBrowserBackend::PackageFetcher do

  let(:base_url) { CranBrowserBackend::PackagesFetcher::BASE_URL }
  let(:file_type) { CranBrowserBackend::PackagesFetcher::FILE_TYPE }

  let(:package_source) do
    { url: "#{base_url}aftgee_0.3-7.#{file_type}", file_name: "aftgee_0.3-7.#{file_type}", directory_name: "aftgee"}
  end

  let(:package_data) do
    [{"Package"=>"aftgee", "Type"=>"Package", "Title"=>"Accelerated Failure Time Model with Generalized Estimating Equations", "Version"=>"0.3-7", "Date"=>"2012-09-26", "Author"=>"Sy Han Chiou, Sangwook Kang, Jun Yan", "Maintainer"=>"Sy Han Chiou <steven.chiou@uconn.edu>", "Description"=>"This package features both rank-based estimates and least square estimates to the Accelerated Failure Time (AFT) model. For rank-based estimation, it provides approaches that include the computationally efficient Gehan's weight and the general's weight such as the logrank weight. For the least square estimation, the estimating equation is solved with Generalized Estimating Equations (GEE). Moreover, in multivariate cases, the dependence working correlation structure can be specified in GEE's setting.", "License"=>"GPL (>= 3)", "Imports"=>"MASS, BB, survival, geepack", "LazyLoad"=>"yes", "Packaged"=>"2012-09-26 20:27:40 UTC; schiou", "Repository"=>"CRAN", "Date/Publication"=>"2012-09-27 10:12:30"}]
  end

  let(:sandbox_path) { CranBrowserBackend::ROOT + '/spec/sandbox' }

  before do
    stub_const("CranBrowserBackend::SANDBOX", sandbox_path)
    `cp #{CranBrowserBackend::ROOT}/spec/fixtures/aftgee_0.3-7.tar.gz #{sandbox_path}`
  end


  it "should perform" do
    CranBrowserBackend::Downloader.should_receive(:get).with(package_source[:url])
    CranBrowserBackend::PackageFetcher.fetch(package_source).should == package_data

    `ls #{CranBrowserBackend::SANDBOX}`.length.should == 0
  end

end
