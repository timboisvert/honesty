require 'test/unit'
require 'logger'
require File.expand_path(File.dirname(__FILE__) + '/../rails/init')

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

class HonestyTest < Test::Unit::TestCase

  def setup_facts
    require File.expand_path(File.dirname(__FILE__) + '/../lib/generators/honesty/templates/create_facts') 
    CreateFacts.up
    load(File.expand_path(File.dirname(__FILE__) + '/../lib/generators/honesty/templates/fact.rb'))
  end

  def setup_test_models
    load(File.expand_path(File.dirname(__FILE__) + '/schema.rb'))
    load(File.expand_path(File.dirname(__FILE__) + '/models.rb'))
  end

  def setup
    setup_facts
    setup_test_models
  end

  def teardown
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.drop_table(table)
    end
  end

  def test_create_fact
    shoe = Shoe.create(:name => "Adidas Superstar II")
    assert_not_nil shoe.facts.create(:context => "Shoe", :agent => "Tim Boisvert", :action => "Create").id
  end

  def test_create_fact_quick
    shoe = Shoe.create(:name => "Adidas Superstar II")
    assert_not_nil shoe.fact("Shoe", "Tim Boisvert", "Create").id
    assert_not_nil shoe.fact("Tim Boisvert", "Create").id
  end

  def test_fetch_facts
    shoe = Shoe.create(:name => "Adidas Superstar II")
    shoe.facts.create(:context => "Shoe", :agent => "Tim Boisvert", :action => "Create")
    honest = Shoe.find(1)
    assert_equal 1, honest.facts.length
    assert_equal "Shoe", honest.facts.first.context
    assert_equal "Tim Boisvert", honest.facts.first.agent
    assert_equal "Create", honest.facts.first.action
  end

#  def test_find_honest
#    shoe = Shoe.create(:name => "Adidas Superstar II")
#    fact = shoe.facts.create(:context => "Shoe", :agent => "Tim Boisvert", :action => "Create")
#    assert_equal shoe, Fact.find_honest(shoe.class.name, shoe.id) 
#  end

#  def test_find_facts_for
#    Shoe = Shoe.create(:name => "Adidas Superstar II")
#    shoe.facts.create(:context => "Shoe", :agent => "Tim Boisvert", :action => "create")
#    assert_equal [fact], Shoe.find_fact_for(shoe)
#  end

end
