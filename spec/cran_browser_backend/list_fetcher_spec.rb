require 'spec_helper'
require 'fileutils'

describe CranBrowserBackend::ListFetcher do
  let(:url) { CranBrowserBackend::ListFetcher::URL }

  let(:sandbox_path) { File.expand_path('spec/sandbox', CranBrowserBackend::ROOT) }

  before do
    stub_const("CranBrowserBackend::SANDBOX", sandbox_path)
    file_to_copy = File.expand_path('spec/fixtures/PACKAGES.gz',CranBrowserBackend::ROOT)
    FileUtils.cp(file_to_copy, sandbox_path)
  end

  it 'should download package and get package dcf' do
    CranBrowserBackend::Downloader.should_receive(:get).with(url)
    Dcf.should_receive(:parse).with(File.read(File.expand_path('spec/fixtures/PACKAGES', CranBrowserBackend::ROOT)))

    CranBrowserBackend::ListFetcher.fetch

    `ls #{CranBrowserBackend::SANDBOX}`.length.should == 0
  end
end
