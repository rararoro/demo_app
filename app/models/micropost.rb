class Micropost < ActiveRecord::Base
	belongings_to :user
	validates :content,length:{maximum: 140}
end
