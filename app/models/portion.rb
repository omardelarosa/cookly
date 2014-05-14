class Portion < ActiveRecord::Base
  # two foreign keys, two parents
  belongs_to  :recipe
  belongs_to  :ingredient


end
