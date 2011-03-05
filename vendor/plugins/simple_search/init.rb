# Include hook code here
require 'active_record'
require 'simple_search'
ActiveRecord::Base.send(:extend, BeginningRails::SimpleSearch)
