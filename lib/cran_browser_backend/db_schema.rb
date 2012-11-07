module CranBrowserBackend
  class DbSchema < ActiveRecord::Migration
    def up
      create_table :packages do |t|
        t.string :name, null: false
        t.timestamps
      end

      create_table :package_versions do |t|
        t.string :package_id, null: false
        t.string :package_type
        t.string :title
        t.string :version
        t.string :date
        t.string :author
        t.string :depends
        t.string :suggests
        t.string :maintainer
        t.text :description
        t.string :license
        t.string :imports
        t.string :lazy_load
        t.string :packaged_at
        t.string :repository
        t.string :publication_date
        t.timestamps
      end
    end

    def down
      drop_table :packages
      drop_table :package_versions
    end
  end
end
