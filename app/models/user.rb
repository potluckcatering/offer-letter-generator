class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # belongs_to :position
  # belongs_to :department

  has_many :employment_contracts, class_name: 'EmploymentContract', foreign_key: :supervisor_id

  def name
    first_name + " " + last_name
  end

end
