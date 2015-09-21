setup_sqlite_db = lambda do
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
  ActiveRecord::Migrator.up('db/migrate') # use migrations
end

silence_stream(STDOUT, &setup_sqlite_db)
ActiveRecord::Migration.maintain_test_schema!
