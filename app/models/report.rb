class Report < ApplicationRecord
    belongs_to :group
    belongs_to :tag
    has_many :documents
end
