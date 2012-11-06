require 'spec_helper'

describe CranBrowserBackend::ListFetcher do
  let(:url) { CranBrowserBackend::ListFetcher::URL }

  let(:sandbox_path) { CranBrowserBackend::ROOT + '/spec/sandbox' }

  before do
    stub_const("CranBrowserBackend::SANDBOX", sandbox_path)
    `cp #{CranBrowserBackend::ROOT}/spec/fixtures/PACKAGES.gz #{sandbox_path}`
  end

  it 'should download package and get package dcf' do
    CranBrowserBackend::Downloader.should_receive(:get).with(url)
    Dcf.should_receive(:parse).with(File.read(CranBrowserBackend::ROOT + '/spec/fixtures/PACKAGES'))

    CranBrowserBackend::ListFetcher.fetch

    `ls #{CranBrowserBackend::SANDBOX}`.length.should == 0
  end
end
