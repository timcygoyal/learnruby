class Songlist
	include Message,Common

	Class_Name=" Varun Bhola class"
	attr_reader :songs,:result,:filedata
	def initialize(&block)
		@songs,@block=Array.new,block

	end
	def append(asong)
		@songs.push(asong)
		self#retuning self object when appending
	end
	def deletefirst
		@songs.shift
	end
	def deletelast
		@songs.pop
	end

	def [](key)
		if key.kind_of?(Integer)
			result=@songs[key]
		else
			result = @songs.find { |aSong| key == aSong.name }
		end
		retun result
	end

	def price(quanity,&t)
		@t=t
		@block.call(quanity) * @t.call(1)

	end

	def loop
		@a=1
		@a*=2 while @a < 100
		return @a
	end

	#error handling
	def writeinfile(path,str)

		begin
			if str=="" then raise "no data for file" end
			opFile= File.open(path,"w")	
			opFile.write(str)
			opFile.close
			@result="Successfully write file"
		rescue SyntaxError=> syerr
			@result=syerr
		rescue Exception => e
			@result=" error when creating file #{e}" 
		ensure
			@result="remove this error then try #{@result}" 
		end
	end

	def getresult
		return message
	end

	def readfile(path)
		@filedata=""
		IO.foreach(path) { |line| @filedata+= line +"\n\n" }
		return @filedata
	end

	def checkresult(score)
		return case score
   			when 0..40 then "Fail"
   			when 41..60 then "pass"
   			when 61..70 then "Pass with Merit"
   			when 71..100 then "Pass with Distinction"
   			else "Invalid Score"
		end
	end

end