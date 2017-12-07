class Order < ActiveRecord::Base
	validates :name, :email, :from, :to, :date, presence: true
end
