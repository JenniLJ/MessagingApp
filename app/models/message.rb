class Message < ApplicationRecord
    belongs_to :user
    belongs_to :conversation, touch: true
end
