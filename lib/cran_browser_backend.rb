require 'active_record'
require "cran_browser_backend/version"
require "cran_browser_backend/fetcher"
require "cran_browser_backend/list_fetcher"
require "cran_browser_backend/packages_fetcher_resolver"
require "cran_browser_backend/packages_fetcher"
require "cran_browser_backend/package_fetcher"
require "cran_browser_backend/downloader"
require "cran_browser_backend/runner"
require "cran_browser_backend/packages_updater"
require "cran_browser_backend/db_schema"
require "cran_browser_backend/package_store"
require "cran_browser_backend/package_version_store"

module CranBrowserBackend
  ROOT = File.expand_path('../', File.dirname(__FILE__))
  SANDBOX = File.expand_path('sandbox', ROOT)
end
