class Tagmap < ApplicationRecord
  belongs_to :movie
  belongs_to :tag
end
