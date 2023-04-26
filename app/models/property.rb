class Property < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true

    ZIP_CODE_REGEX = /\A\d{5}(-\d{4})?\z/
    validates :zip_code, format: { with: ZIP_CODE_REGEX }
end
