require 'spec_helper'

describe CranBrowserBackend::PackagesFetcher do

  let(:base_url) { CranBrowserBackend::PackagesFetcher::BASE_URL }
  let(:file_type) { CranBrowserBackend::PackagesFetcher::FILE_TYPE }
  let(:packages_to_get) { [{"Package"=>"abc", "Version"=>"1.7"}, {"Package"=>"test", "Version"=>"0.4"}] }

  let(:packages_data) do
    [{ url: "#{base_url}abc_1.7.#{file_type}", file_name: "abc_1.7.#{file_type}", directory_name: "abc"},
     { url: "#{base_url}test_0.4.#{file_type}", file_name: "test_0.4.#{file_type}", directory_name: "test"}]
  end


  it 'it should list packages data' do
    packages_data.each do |data|
      CranBrowserBackend::PackageFetcher.should_receive(:fetch).with(data)
    end

    CranBrowserBackend::PackagesFetcher.fetch(packages_to_get)
  end

end
