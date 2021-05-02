class Publisher < ApplicationRecord
  has_many :books # booksに対して1対多
end
