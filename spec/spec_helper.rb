require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection('adapter'  => 'sqlite3',
                                        'database' => 'spec/test.sqlite3')


RSpec.configure do |config|
  config.before(:all) do
    CranBrowserBackend::DbSchema.new.up
  end

  config.after(:all) do
    CranBrowserBackend::DbSchema.new.down
  end
end
