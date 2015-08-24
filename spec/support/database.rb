ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
# Don't show migration output
ActiveRecord::Schema.verbose = false
ActiveRecord::Migrator.up("#{Rails.root}/db/migrate")
ActiveRecord::Migration.maintain_test_schema!
