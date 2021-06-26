class Graph < ApplicationRecord
  belongs_to :user
  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :weight, presence: true

  def self.chart_data(user)
      # そのままデータを取り出すと，日付が不連続なデータになるため，日付の連続したデータを作成する。
    graphs = user.graphs.order(date: :asc)
    # 記録がない時エラーを出さずに nil を返して記録
    return [{date: Date.today, weight: nil}] if graphs.empty?

    # 記録した初日から最終日までのデータを取得
    period = graphs[0].date..graphs[-1].date

    # 記録の配列データを生成
    index = 0
    period.map do |date|
      if graphs[index].date == date
        weight = graphs[index].weight
        index += 1
      end
      # データが存在しない日付の体重は nil とする。
      { date: date, weight: weight }
    end
  end
end
