class Title
  attr_accessor :symbol, :wasClick

  def initialize(symbol)
    @symbol = symbol
    @wasClick = false
  end
end

class Board
  attr_accessor :titles

  def initialize
    @titles = [Title.new(1), Title.new(2), Title.new(3), Title.new(4), Title.new(5), Title.new(6), Title.new(7),
               Title.new(8), Title.new(9)]
  end

  def display_board
    print "#{titles[0].symbol}, #{titles[1].symbol}, #{titles[2].symbol}\n#{titles[3].symbol}, #{titles[4].symbol}, #{titles[5].symbol}\n#{titles[6].symbol}, #{titles[7].symbol}, #{titles[8].symbol}\n"
  end
end

class Player
  attr_accessor :name, :symbol, :is_my_turn

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @is_my_turn = false
  end
end

class Game
  attr_accessor :player_one, :player_two, :board

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
  end

  def game_start
    max_number_of_rounds = 9
    round_counter = 0
    player_one.is_my_turn = true
    loop do

      if round_counter == max_number_of_rounds
        puts 'Max round number was played'
        break
      end

      if check_winner == true
        winning_message = player_one.is_my_turn ? "The winner is #{player_one.name}" : "The winner is #{player_two.name}"
        puts winning_message
        break
      end

      print 'Choose number of the title you want to place your mark on: '
      chosen_title = gets.chomp.to_i
      if board.titles[chosen_title - 1].wasClick
        puts 'Selected title was already clicked, please choose other title!'
        next
      end
      if player_one.is_my_turn == true
        board.titles[chosen_title - 1].wasClick = true
        board.titles[chosen_title - 1].symbol = player_one.symbol
        board.display_board
        check_winner
        player_one.is_my_turn = false
        player_two.is_my_turn = true
        round_counter += 1

      elsif player_two.is_my_turn == true
        board.titles[chosen_title - 1].symbol = player_two.symbol
        board.display_board
        check_winner
        player_two.is_my_turn = false
        player_one.is_my_turn = true
        round_counter += 1

      end

    end
  end

  def check_row
    if board.titles[0].symbol == board.titles[1].symbol && board.titles[1].symbol == board.titles[2].symbol || board.titles[3].symbol == board.titles[4].symbol && board.titles[4].symbol == board.titles[5].symbol || board.titles[6].symbol == board.titles[7].symbol && board.titles[7].symbol == board.titles[8].symbol
      true
    end
  end

  def check_column
    if board.titles[0].symbol == board.titles[3].symbol && board.titles[3].symbol == board.titles[6].symbol || board.titles[1].symbol == board.titles[4].symbol && board.titles[4].symbol == board.titles[7].symbol || board.titles[2].symbol == board.titles[5].symbol && board.titles[5].symbol == board.titles[8].symbol
      true
    end
  end

  def check_diagonal
    if board.titles[0].symbol == board.titles[4].symbol && board.titles[4].symbol == board.titles[8].symbol || board.titles[2].symbol == board.titles[4].symbol && board.titles[4].symbol == board.titles[6].symbol
      true
    end
  end

  def check_winner
    return unless check_row || check_column || check_diagonal

    true
  end
end

game = Game.new(Player.new('Bart', 'X'), Player.new('Adam', '0'))
game.game_start
