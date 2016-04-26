class DownloadsController < ApplicationController
  def statistics
    if !session[:user_id]
       redirect_to '/login'
    end  
  	@stats = Download.find_by_sql("SELECT articles.title,COUNT(*) as count FROM downloads 
					INNER JOIN articles ON downloads.article_id = articles.id
					GROUP BY article_id ORDER BY count DESC")

  	 @downloadsCount ||= Array.new
  	 @downloadsTitle ||= Array.new
  	 @stats.each do |stat|
	 	@downloadsCount.push(stat.count)
	 	@downloadsTitle.push(stat.title)
	 end


  	@testGraph = Gchart.pie(:data => @downloadsCount, :title => 'Aritcles Download Stats', :size => '600x400', :labels => @downloadsTitle)
  end
end
