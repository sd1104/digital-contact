class RoomCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  ROOM_NUM = 15  # 同時にユーザーを作成する数
  attr_accessor :collection  # ここに作成したルームモデルが格納される

  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
        Room.new(
          number: value['number'],
          grade: value['grade'],
          school_id: value['school_id']
        )
      end
    else
      self.collection = ROOM_NUM.times.map{ Room.new }
    end
  end

  # レコードが存在するか確認するメソッド
  def persisted?
    false
  end

  def save
    ActiveRecord::Base.transaction do
      collection.each do |result|
        result.save
      end
    end
    rescue
      p 'エラー'
  end


end