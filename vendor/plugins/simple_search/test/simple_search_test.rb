require 'test_helper'

$stdout = StringIO.new

def create_properties_table
	ActiveRecord::Schema.define(:version => 1) do
  		create_table :properties do |t|
			t.column :name, :string
			t.column :description, :text
		end
	end
end

class Property < ActiveRecord::Base
	simple_search :name, :description
end


class SimpleSearchTest < ActiveSupport::TestCase
  setup do
	create_properties_table
	Property.create(:name => 'Some name', :description => 'Some description')
        Property.create(:name => 'another name', :description => 'another description')
  end
  # Replace this with your real tests.
  test "search method is available" do
    assert Article.respond_to?(:search)
  end

  test "should search" do
    assert_equal 1, Article.search("framework").size
    assert_equal 0, Article.search("unknown").size
  end

  test "search method is available with new databes" do
	assert Property.respond_to?(:search)
  end
 
  test "sholud search with new database" do
        assert_equal 2, Property.search("name").size
	assert_equal 1, Property.search("another").size
	assert_equal 0, Property.search("swimming").size
  end
end
