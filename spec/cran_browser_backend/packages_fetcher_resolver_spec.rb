require 'spec_helper'

describe CranBrowserBackend::PackagesFetcherResolver do
  let(:collected_packages) do
    [{"Package"=>"abc", "Version"=>"1.6"}, {"Package"=>"abcdeFBA", "Version"=>"0.4"}, {"Package"=>"abd", "Version"=>"0.2-4"}, {"Package"=>"abind", "Version"=>"1.4-0"}, {"Package"=>"abn", "Version"=>"0.8"}]
  end

  let(:cran_packages) do
    [{"Package"=>"abc", "Version"=>"1.7"}, {"Package"=>"test", "Version"=>"0.4"}, {"Package"=>"abd", "Version"=>"0.2-4"}, {"Package"=>"abind", "Version"=>"1.4-0"}, {"Package"=>"abn", "Version"=>"0.8"}]
  end

  let(:expected_result) do
    [{"Package"=>"abc", "Version"=>"1.7"}, {"Package"=>"test", "Version"=>"0.4"}]
  end

  it 'should determine packages to fetch' do
    result = CranBrowserBackend::PackagesFetcherResolver.packages_to_get(collected_packages: collected_packages, cran_packages: cran_packages)
    result.should == expected_result
  end

  it 'should determine all cran packages on first fetch' do
    result = CranBrowserBackend::PackagesFetcherResolver.packages_to_get(collected_packages: [], cran_packages: cran_packages)
    result.should == cran_packages
  end
end
