class Title
    
    attr_accessor :number_of_title, :symbol, :wasClick

    def initialize(number_of_title)
        @number_of_title = number_of_title
        @symbol  = '#'
        @wasClick = false
    end
end

class Board

    attr_accessor :titles

    def initialize()
        @titles = [Title.new(1), Title.new(2), Title.new(3), Title.new(4), Title.new(5), Title.new(6), Title.new(7), Title.new(8), Title.new(9)]     
        
    end
    
    def display_board()
        print "#{titles[0].symbol}, #{titles[1].symbol}, #{titles[2].symbol}\n #{titles[3].symbol}, #{titles[4].symbol}, #{titles[5].symbol}\n #{titles[6].symbol}, #{titles[7].symbol}, #{titles[8].symbol}"       
    end
end 

class Player

    attr_accessor :name, :symbol, :is_my_turn

    def initialize(name,symbol)
        @name = name
        @symbol = symbol
        @is_my_turn = false
    end
end

class Game

    attr_accessor :player_one, :player_two, :board

    def initialize(player_one,player_two)
        @player_one = player_one
        @player_two = player_two
        @board = Board.new()
    end
    
    def game_start()
        winner = false
        player_one.is_my_turn = true
        while winner == false
            chosen_title = gets.chomp.to_i
            if player_one.is_my_turn == true
                board.titles[chosen_title-1].symbol = player_one.symbol
                player_one.is_my_turn = false
                player_two.is_my_turn = true
    
            end
            
            if player_two.is_my_turn == true
                board.titles[chosen_title-1].symbol = player_two.symbol
                player_two.is_my_turn = false
                player_one.is_my_turn = true
            end

            winner = true

        end
    end    

end        

game = Game.new(Player.new("Bart","X"),Player.new("Adam","0"))
game.board.display_board()
game.game_start()
game.board.display_board()

