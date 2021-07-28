require "colorize"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length= 1
    @game_over= false
    @seq= []
  end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
      self.show_sequence
      self.require_sequence
      if !@game_over
        self.round_success_message
        @sequence_length+=1
      end
  end

  def show_sequence
    self.add_random_color
    p @seq
  end

  def require_sequence
    i=0
    while i< @seq.length
      puts "Enter either red green blue or yellow in the correct sequence, 1 color at a time"
      input= gets.chomp
      if input != @seq[i]
        @game_over=true
        break
      else
        i+=1
      end
    end
  end

  def add_random_color
    @seq<< COLORS.sample
  end

  def round_success_message
    puts "You did it kid, didn't think you got it in you.".green
  end

  def game_over_message
    puts "Game over man, game over!".red
  end

  def reset_game
    @sequence_length=1
    @game_over= false
    @seq=[]
    self.play
  end
end

test= Simon.new
test.play