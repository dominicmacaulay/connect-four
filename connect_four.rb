class ConnectFour
    attr_reader :board, :player_1, :player_2
    def initialize(board = Array.new(7) {Array.new})
        @board = board
        @player_1 = Player.new("x", "Player 1")
        @player_2 = Player.new("o", "Player 2")
    end
    def play
        display_greeting
        # make a player variable to keep track of the player
        player = player_1
        last_player = player_2
        # loop through the game until either a player wins or the game fills up
        until game_won?(last_player) || board_full?
            # at the top of each game, display the board
            display_board
            puts "#{player.name}'s turn:"
            # get the player's input
            chosen_column = gets.chomp.to_i
            # keep getting input until the player gives valid input
            until check_input(chosen_column) && check_column(chosen_column - 1)
                puts "Invalid input"
                chosen_column = gets.chomp.to_i
            end
            # convert to index number
            chosen_column -= 1
            # add the player's token to the end of thier chosen column
            board[chosen_column].push(player.token)
            # change players
            if player == player_1
                player = player_2
                last_player = player_1
            else
                player = player_1
                last_player = player_2
            end
        end
    end
    def display_greeting
        puts "Welcome to connect 4!"
        puts
        puts "The goal of this game is to place your pieces until you get four in a row."
        puts "This can be done horizontally, vertically, or diagonally."
        puts "Player 1's token is X, whilst Player 2's token is O."
        puts "To make a move, enter the column name you wish to place your token in."
        puts
        puts "Get ready! Here we go!"
    end
    def check_input(input)
        valid_inputs = [1, 2, 3, 4, 5, 6, 7]
        # check if the given input is included in the valid array
        if valid_inputs.include?(input)
            return true
        else
            return false
        end
    end
    def check_column(column)
        if board[column].length >= 6
            return false
        else
            return true
        end
    end
    def board_full?
        # loop through the board array and return false if any sub array doesnt have a length of 6
        board.each do |array|
            unless array.length == 6
                return false
            end
        end
        # if it doesn't return false in the loop, return true
        puts "It's a tie!"
        return true
    end
    def game_won?(player)
        # return true if any methods return true
        if check_diagonal(player.token) || check_horizontal(player.token) || check_vertical(player.token)
            display_board
            puts "#{player.name} has won!"
            return true
        end
        # otherwise, return false
        return false
    end
    def check_horizontal(token)
        # make a count  to see how many are in a row
        count = 0
        # make a index tracker
        index = 0
        # loop through each horizontal level in the board array
        until index >= 5
            # ensure that the spot is not nil
            break if board[3].nil? || board[3][index].nil?
            # check if the middle slot is the same as the token
            if board[3][index] == token 
                # add  to count
                count += 1
                # make a variable for the next slot starting at 4
                next_slot = 4
                # until next  is not equal to token or greater than 6
                while board[next_slot][index] == token && next_slot <= 6
                    # add 1 to count and move next to the right
                    count += 1
                    next_slot += 1
                    break if board[next_slot].nil? || board[next_slot][index].nil?
                end
                # make next equal to 2
                next_slot = 2
                # until next is not equal to token or less than 0
                while board[next_slot][index] == token && next_slot >= 0
                    # increase count and move next to the left
                    count += 1
                    next_slot -= 1
                    break if board[next_slot].nil? || board[next_slot][index].nil?
                end
                # if count equals 4, return true
                if count >= 4
                    return true
                end
                # reset count
                count = 0
            end
            # increase index
            index += 1
        end
        # once the full loop is done, return false
        return false
    end
    def check_vertical(token)
        # for each array in baord do
        @board.each do |array|
            # make sure that the starting slot is not nil 
            next if array[2].nil?
            count = 0
            # make a next slot counter at 3 to go upwards
            next_slot = 3
            # if the nested array's index 2 matches the token, check upwards and downwards
            if array[2] == token
                # increase count 
                count += 1
                # check that the next slot is not nil
                unless array[next_slot].nil?
                    # check upwards for matches
                    while array[next_slot] == token && next_slot <= 5
                        # increase count and next_slot and check that the next slot is not nil
                        count += 1
                        next_slot += 1
                        break if array[next_slot].nil?
                    end
                end
                # make next slot  equal 1 and check downards for matches if downwards is not nil
                next_slot = 1
                unless array[next_slot].nil?
                    while array[next_slot] == token && next_slot >= 0
                        # increase count, decrease next_slot, and check if downwards is nil
                        count += 1
                        next_slot -= 1
                        break if array[next_slot].nil?
                    end
                end
                # check if the player got four in this column
                if count >= 4
                    return true
                end
            end
        end
        # if it doesnt return true in the loop, return false
        return false
    end
    def check_diagonal(token)
        # create an index forcolumns
        column_index = -1
        # loop through column 3 unless it is nil
        until column_index >= 3
            # increase column index
            column_index += 1
            next if board[column_index][0].nil?
            # loop through the rows in this column
            row_index = 0
            until row_index >= 5
                if board[column_index][row_index] == token
                    # increase count
                    count = 1
                    # make temporary variables to check up the rows and columns
                    column = column_index + 1
                    row = row_index + 1
                    # check upwards
                    unless board[column][row].nil?
                        while board[column][row] == token && column <= 6 && row <= 5
                            # increase count, column, and row, and check the next place for nil
                            count += 1
                            column += 1
                            row += 1
                            break if board[column][row].nil?
                        end
                        return true if count >= 4
                    end
                    # reset variables
                    count = 1
                    column = column_index + 1
                    row = row_index - 1
                    # check downwards
                    unless board[column][row].nil?
                        while board[column][row] == token && column >= 0 && row >= 0
                            # increase count and column, decrease row, and check next place for nil
                            count += 1
                            column += 1
                            row -= 1
                            break if board[column][row].nil?
                        end
                        return true if count >= 4
                    end
                end
                # increase row_index
                row_index += 1
            end
        end
        # if the loop never returns true, return false
        return false
    end
    def display_board
        # make a variable for the full board
        full_board = fill_board
        # display the header
        puts 
        puts "1 | 2 | 3 | 4 | 5 | 6 | 7"
        # make a variable to keep track of the row index
        index = 5
        # loop over each row
        until index < 0
            puts "#{full_board[0][index]} | #{full_board[1][index]} | #{full_board[2][index]} | #{full_board[3][index]} | #{full_board[4][index]} | #{full_board[5][index]} | #{full_board[6][index]}"
            # decrease index
            index -= 1
        end
    end
    def fill_board
        # make a board that will fill in all the leftover space from the current game board
        temporary_board = []
        board.each do |array|
            temp_array = []
            array.each do |element|
                temp_array.push(element)
            end
            temporary_board.push(temp_array)
        end
        # add to each sub array until it reaches a length of 6
        temporary_board.each do |array|
            until array.length == 6
                array.push("*")
            end
        end
        temporary_board
    end
end
class Player
    attr_reader :token, :name
    def initialize(token, name)
        @token = token
        @name = name
    end
end
game = ConnectFour.new
game.play