require 'rails/generators/migration'

class HonestyGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_model_file
    template "fact.rb", "app/models/fact.rb"
    migration_template "create_facts.rb", "db/migrate/create_facts.rb"
  end
end
