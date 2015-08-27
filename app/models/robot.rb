class Robot < ActiveRecord::Base
  field :name,    as: :string
  field :version, as: :integer
end
