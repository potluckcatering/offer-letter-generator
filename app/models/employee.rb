class Employee < ApplicationRecord
  has_one :employment_contract, dependent: :destroy
  has_one :position, through: :employment_contract
  has_one :department, through: :employment_contract

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true

  validates :first_name, :last_name, presence: true

  def name
    first_name + " " + last_name
  end

end
