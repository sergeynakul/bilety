class Order < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(created_at: :asc) }
	validates :from, :to, :date, :user_id, presence: true
end
