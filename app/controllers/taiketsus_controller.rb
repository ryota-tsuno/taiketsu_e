class TaiketsusController < ApplicationController

    def index
# 初期表示
      hash = {}
      keys = []
      @taiketsus = Taiketsu.all
      @taiketsus.each do |taiketsu|
        comments = taiketsu.topics.joins(:comments).group(:topic_id).count
        if comments.values[0].blank? && comments.values[1].blank?
          sum = 0
        elsif comments.values[0].blank?
          sum = comments.values[1]
        elsif comments.values[1].blank?
          sum = comments.values[0]
        else
          sum = comments.values[0] + comments.values[1]
        end
        hash[taiketsu.id] = sum
      end
      @comment_hash = hash.sort_by {| k, v | v}.reverse
      @comment_hash.each do |key|
         keys << key[0]
      end

      @hot_taiketsus = Taiketsu.where(id: keys).order(['field(id, ?)', keys]).page(params[:page]).per(12)
      @accepting_taiketsus= Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")
      @taiketsu = Taiketsu.new
      @taiketsu.topics.build

# インクリメンタルサーチ
      # topicを検索
      @topics = Topic.where('topic LIKE(?)', "%#{params[:keyword]}%")
      # 配列を作成
      taiketsu_id_array = []
      @array = []
      # 検索したtopicのtaiketsu_idを配列に入れる
      @topics.each do |topic|
        taiketsu_id_array << topic.taiketsu_id
      end
      # 被ったtaiketsu_idを排除
      taiketsu_id_array.uniq!
      # taiketsu_idからtaiketsuレコードを取得し配列に入れる
      taiketsu_id_array.each do |taiketsu_id|
        search_taiketsu = Taiketsu.find(taiketsu_id)
        @array << search_taiketsu
      end
      respond_to do |format|
        format.html
        format.json
      end
    end

    def show
      @session = session[:session_id]
      @taiketsus = Taiketsu.new
      @taiketsus.topics.build

      @taiketsu = Taiketsu.find(params[:id])
      @taiketsu_topics = @taiketsu.topics
      @topic_first = @taiketsu_topics.first
      @topic_second = @taiketsu_topics.second

      @comment = Comment.new
      @comments_first = @topic_first.comments
      @comments_second = @topic_second.comments

      @accepting_taiketsus = Taiketsu.includes(:topics).page(params[:page]).per(6).order("created_at DESC")
    end

    def create
      @taiketsu = Taiketsu.new(taiketsu_params)
      @taiketsu.session_id = session[:session_id]
      if @taiketsu.save
        redirect_to taiketsus_path
      else
        render :show
      end
    end

    def destroy
      @taiketsu = Taiketsu.find(params[:id])
      @taiketsu.destroy
      redirect_to taiketsus_path
    end

  private

    def taiketsu_params
      params.require(:taiketsu).permit(
        topics_attributes: [:topic]
      )
    end

end
