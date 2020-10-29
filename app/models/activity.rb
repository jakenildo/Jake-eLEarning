class Activity < ApplicationRecord
    belongs_to :actionable, polymorphic: true 
end
