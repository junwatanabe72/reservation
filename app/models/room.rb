class Room < ApplicationRecord
  before_validation :space_edit

  validates :name, :place, :number , presence: true
  validates :name  , length: {maximum: 30}
  validates :place , inclusion: ["東京","大阪","福岡","札幌","仙台","金沢"]
  validates :number , numericality: { greater_than: 4, less_than: 31}

  validate :name_check
  validate :check_x5

  has_many :entries , dependent: :destroy

  private
   def name_check
      name_pattern = /\A.+#\d{2}\z/
       unless name_pattern.match(name)
         errors.add(:name, "会議室名が正しくありません。")
       end
   end

   def check_x5
       if (self.number.to_i % 5) != 0
         errors.add(:number, "収容人数は5の倍数で指定してください")
       end
     end

     def space_edit
        self.name = self.name.strip.gsub(/ +/, "_")
      end


end
