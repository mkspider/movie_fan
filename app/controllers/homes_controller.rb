class HomesController < ApplicationController
 def index
   @movies = Movie.all
 end

 def search
    @keywords = params[:keywords].split(/[[:blank:]]+/)
    #   AND : AND検索 / OR : OR検索
    @type = params[:type]
    @results = Movie.none

    if @type == 'AND'
      @keywords.each_with_index do |keyword, i|
        @results = Movie.search(keyword) if i == 0
        @results = @results.merge(@results.search(keyword))
      end
    else
      # OR検索
      @keywords.each do |keyword|
        @results = @results.or(Movie.search(keyword))
      end
    end
    render :index
 end

  def top

  end

  def user_sign_in
    if sign_in user
    flash.now[:notice] = "待っていました<% current_user.name %>さん"
    end
    byebug
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
