class Foo < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :strength
  validates_presence_of :agility
  validates_presence_of :intelligence
end
