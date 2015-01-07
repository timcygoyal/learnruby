class Song
	include Comparable
	attr_reader :name,:artist,:duration
	def initialize (name,artist,duration)
		@name=name
		@artist=artist
		@duration=duration
	end

	def <=>(other)
		self.duration<=>other.duration
	end
end