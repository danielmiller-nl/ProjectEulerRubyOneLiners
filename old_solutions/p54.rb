require_relative 'string_extensions'
require_relative 'array_extensions'

class PokerHand
	attr_accessor :numbers, :grouped, :rank
	
	$royal_conversion = {'T'=>10, 'J'=>11, 'Q'=>12, 'K'=>13, 'A'=>14}
	
	def initialize(card_array)
		@numbers = card_array.map{|card|card[0,1].is_i? ? card[0,1].to_i : $royal_conversion[card[0,1]]}.sort
		@grouped = grouped_(@numbers)
		suits = card_array.map {|card| card[-1,1]}
		@rank = rank_(@numbers,suits,@grouped)
	end
	
	def wins_against?(poker_hand)
		sr = self.rank
		phr = poker_hand.rank
		
		if sr > phr
			true
		elsif sr < phr
			false
		else
			sn = self.numbers
			phn = poker_hand.numbers
			
			case sr
			when 1, 5, 6, 9
				i = 4
				while i>=0
					if sn[i] > phn[i]
						return true
					elsif sn[i] < phn[i]
						return false
					end
					i-=1
				end
				return false
			else
				s_set_n = self.grouped.select{|set|set.length>1}
				ph_set_n = poker_hand.grouped.select{|set|set.length>1}
				s_ones_n = self.grouped.select{|set|set.length==1}
				ph_ones_n = poker_hand.grouped.select{|set|set.length==1}
				
				if sr == 2
					return s_set_n[0][0]>ph_set_n[0][0] if s_set_n[0][0]!=ph_set_n[0][0]
					i = 2
					while i>=0
						if s_ones_n[i][0] > ph_ones_n[i][0]
							return true
						elsif s_ones_n[i][0] < ph_ones_n[i][0]
							return false
						end
						i-=1
					end
					false
				elsif sr == 3
					if s_set_n[1][0]!=ph_set_n[1][0]
						s_set_n[1][0]>ph_set_n[1][0]
					else
						return s_set_n[0][0]>ph_set_n[0][0] if s_set_n[0][0]!=ph_set_n[0][0] 
						s_ones_n[0][0]>ph_ones_n[0][0]
					end
				else
					if s_set_n.length == 1
						s_set_n[0][0]>ph_set_n[0][0]
					else
						puts "#{self.numbers} #{poker_hand.numbers} #{s_set_n} #{ph_set_n}"
					end
				end
			end	
		end
	end
	
	def rank_(numbers,suits,grouped)
		
		straight = numbers.sequence? {|a,b| b == a+1}
		flush = suits.all? {|suit| suit == suits[0]}
		if flush
			straight ? 9 : 6
		elsif straight
			5
		else
			case grouped.length
			when 5
				1
			when 4
				2
			when 3
				grouped[-1].length == 2 ? 3 : 4 #note that this is flawed [7,7,13,13,14] returns 4
			else
				grouped[-1].length == 3 ? 7 : 8
			end
		end
	end
	
	def grouped_(numbers)
		grouped = numbers.dup
		grouped[0] = [grouped[0]]
		i = 1
		while i < grouped.length
			if grouped[i]==grouped[i-1][0]
				grouped[i-1] << grouped[i]
				grouped.delete_at(i)
				i-=1
			else
				grouped[i] = [grouped[i]]
			end
			i+=1
		end
		grouped
	end
end

player1_wins = 0
File.open("p054_poker.txt").each do |line|
	player1 = PokerHand.new(line[0..13].split(" "))
	player2 = PokerHand.new(line[15..28].split(" "))
	if player1.wins_against?(player2)
		player1_wins+=1
	end
end
puts player1_wins 




