class Event < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  belongs_to :user

  scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない

    branch_like(search_params[:branch])
      .date_and_time_from(search_params[:date_and_time_from])#下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
      .date_and_time_to(search_params[:date_and_time_to])
  end

  scope :branch_like, -> (branch) { where('branch LIKE ?', "%#{branch}%") if branch.present? }  #scopeを定義
  scope :date_and_time_from, -> (from) { where('? <= event_date', from) if from.present? }
  scope :date_and_time_to, -> (to) { where('event_date < ?', (Date.parse(to)+1).to_s) if to.present? }

end
