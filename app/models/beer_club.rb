class BeerClub < ActiveRecord::Base
	has_many :memberships
	has_many :members, through: :memberships , source: :user

	has_many :confirmed_memberships, -> {where confirmed:true}, class_name: "Membership"
	has_many :unconfirmed_memberships, -> {where confirmed:[false, nil]}, class_name: "Membership"


	has_many :confirmed_members, through: :confirmed_memberships, source: :user
	has_many :unconfirmed_members, through: :unconfirmed_memberships, source: :user
end
