class Infection < ApplicationRecord
  belongs_to :bacterium
  belongs_to :user
end
