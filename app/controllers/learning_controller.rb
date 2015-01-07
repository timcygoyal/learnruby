class LearningController < ApplicationController

	def index
		@obj=Songlist.new {|amt| amt * 40}
		@obj.append(Song.new("varun","Bhola",340))
		@amount=@obj.price(6){|t| t * 2}
		@obj.append(Song.new("rahul","gupta",230))
		@obj.deletefirst
		@obj.deletelast
		@obj.append(Song.new("rahul1","gupta1",230))
		@loop1=@obj.loop

		@result=@obj.writeinfile("test123444.csv","test")
		@moduleresult=@obj.getresult

		song1=Song.new("song1","song1",100)
		song2=Song.new("song2","song2",110)
		@t=song1<=>song2
		case @t
		when -1
			@compareresult="song 1 smaller than song 2"
		when 0
			@compareresult="song 1 equal  to song 2"
		when 1
			@compareresult="song 1 greater  than song 2"
		else
			@compareresult="invalid result"
		end

		@obj.sum(10,12)

		@obj1=Songlist.new
		@obj1.sum(22,34)
		@filedata=@obj.readfile("test123444.csv")

		#date and time in ruby
		@time1=Time.new
		values= @time1.to_a
		@longvalues=Time.utc(*values)

		@checkresult1=@obj.checkresult(50)
		@ClassName=Songlist::Class_Name

	end
end
