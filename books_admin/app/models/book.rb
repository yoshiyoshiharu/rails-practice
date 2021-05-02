class Book < ApplicationRecord
  # Scopeを定義する
  # Scopeとは、よく利用する検索条件に名前をつけてひとまとめにしたもの
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, -> (theme) { where("name like ?", "%{theme}%") } # themeを引数にしたScope
  # 上を用いれば、Book.costly.written_about("Java")のようにかける

  belongs_to :publisher # publisherに対して多対1
  
  # 多対多の定義
  has_many :book_authors
  has_many :authors, through: :book_authors

  # バリデーション
  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericity: { greater_than_or_equal_to: 0 } # price >= 0

  # 独自バリデーション
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise."
    end
  end

  # コールバック制御
  before_validation do
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  # あるいはメソッドを使って以下のようにかける
  before_validation :add_lovely_to_cat

  def add_lovely_to_cat
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  # 削除後にログに追記
  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end

  # コールバック起動に条件を追加
  after_destroy :if => :high_price? do
    Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    Rails.logger.warn "Please check!"
  end

  def high_price?
    price >= 500
  end

  # ActiveRecord::Enumで列挙型を扱う
  enum sales_status: {
    reservation: 0,
    now_on_sale: 1,
    end_of_print: 2
  }
  
end
