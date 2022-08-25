class HomesController < ApplicationController
 def index
   @movies = Movie.all
 end

 def search
    # splitで正規表現を使ってキーワードを空白(全角・半角・連続)分割する
    #   連続した空白も除去するので、最後の“+”がポイント
    @keywords = params[:keywords].split(/[[:blank:]]+/)

    # 検索タイプ取得
    #   AND : AND検索 / OR : OR検索
    @type = params[:type]

    # 空のモデルオブジェクト作成（何も入っていない空配列のようなもの）
    @results = Movie.none

    # タイプ別で検索実行
    if @type == 'AND'
      # -----------
      # AND検索
      # -----------
      @keywords.each_with_index do |keyword, i|
        # 1回目のループでは、1つ目のワードで検索
        #   結果を@resultsに詰め込む
        @results = Movie.search(keyword) if i == 0

        # 2回目以降のループでは、1回目の結果を更にモデル定義の検索メソッドで絞り込みしていく
        #   結果を@resultsに詰め込む
        @results = @results.merge(@results.search(keyword))
      end
    else
      # -----------
      # OR検索
      # -----------
      @keywords.each do |keyword|
        # 単純にモデル定義の検索メソッドにデータを渡す。
        #   検索ワードの数だけor検索を行う
        #   結果を@resultsに詰め込む
        @results = @results.or(Movie.search(keyword))
      end
    end

    render :index
 end

  def top

  end


  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
