class Due < ActiveRecord::Base
  belongs_to :league
  belongs_to :commissioner
  belongs_to :manager
end
