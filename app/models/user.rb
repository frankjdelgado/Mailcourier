class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_many :packages_sent, class_name: "Package", foreign_key: "sender_id"
	has_many :packages_received, class_name: "Package", foreign_key: "receiver_id"

  	belongs_to :agency

  	# Validations
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :agency_id, presence: true
	validates :encrypted_password, presence: true

	default_scope {order(username: :asc)}
	scope :admins, -> { where(role: 2) }
	scope :operators, -> { where(role: 1) }
	scope :members, -> { where(role: 0) }

	paginates_per 15

	def is_admin?
		if role == 2
			return true
		else
			return false
		end
	end

	def is_member?
		if role == 0
			return true
		else
			return false
		end
	end

	def is_operator?
		if role == 1
			return true
		else
			return false
		end
	end

	def package_role(package)
		if(package.sender_id == id)
			return 'Sender'
		else
			return 'Receiver'
		end
	end

	def packages
   		Package.where('sender_id = ? OR receiver_id = ?', id, id)
 	end
	
end
