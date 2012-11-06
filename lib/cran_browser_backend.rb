require "cran_browser_backend/version"
require "cran_browser_backend/list_fetcher"
require "cran_browser_backend/list_parser"
require "cran_browser_backend/packages_fetcher_resolver"

module CranBrowserBackend
  ROOT = `pwd`.chop
  SANDBOX = ROOT + '/sandbox'
end
