require "cran_browser_backend/version"
require "cran_browser_backend/fetcher"
require "cran_browser_backend/list_fetcher"
require "cran_browser_backend/packages_fetcher_resolver"
require "cran_browser_backend/packages_fetcher"
require "cran_browser_backend/package_fetcher"
require "cran_browser_backend/downloader"
require "cran_browser_backend/runner"
require "cran_browser_backend/packages_updater"

module CranBrowserBackend
  ROOT = `pwd`.chop
  SANDBOX = ROOT + '/sandbox'
end
