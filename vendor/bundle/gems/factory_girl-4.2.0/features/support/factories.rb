ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => File.join(File.dirname(__FILE__), 'test.db')
)

class CreateSchema < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string :name
    end
  end
end

CreateSchema.suppress_messages { CreateSchema.migrate(:up) }

class Category < ActiveRecord::Base; end
FactoryGirl.define do
  factory :user do
    name     "dj moonbat"
    email    "dj.moonbat@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end