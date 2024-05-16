class ConnectFour
    def check_horizontal(piece, board)
        # make a count  to see how many are in a row
        count = 0
        # make a index tracker
        index = 0
        # loop through each horizontal level in the board array
        until index >= 5
            # ensure that the spot is not nil
            break if board[3].nil? || board[3][index].nil?
            # check if the middle slot is the same as the piece
            if board[3][index] == piece 
                # add  to count
                count += 1
                # make a variable for the next slot starting at 4
                next_slot = 4
                # until next  is not equal to piece or greater than 6
                while board[next_slot][index] == piece && next_slot <= 6
                    # add 1 to count and move next to the right
                    count += 1
                    next_slot += 1
                    break if board[next_slot].nil? || board[next_slot][index].nil?
                end
                # make next equal to 2
                next_slot = 2
                # until next is not equal to piece or less than 0
                while board[next_slot][index] == piece && next_slot >= 0
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
    def check_vertical(piece, board)
        # make counter to see how many are in a row
        count = 0
        # for each array in baord do
        board.each do |array|
            # make sure that the starting slot is not nil 
            break if array[2].nil?
            # make a next slot counter at 3 to go upwards
            next_slot = 3
            # if the nested array's index 2 matches the piece, check upwards and downwards
            if array[2] == piece
                # increase count 
                count += 1
                # check that the next slot is not nil
                unless array[next_slot].nil?
                    # check upwards for matches
                    while array[next_slot] == piece && next_slot <= 5
                        # increase count and next_slot and check that the next slot is not nil
                        count += 1
                        next_slot += 1
                        break if array[next_slot].nil?
                    end
                end
                # make next slot  equal 1 and check downards for matches if downwards is not nil
                next_slot = 1
                unless array[next_slot].nil?
                    while array[next_slot] == piece && next_slot >= 0
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
                # reset count
                count = 0
            end
        end
        # if it doesnt return true in the loop, return false
        return false
    end
    def check_diagonal(piece, board)
        # create an index forcolumns
        column_index = 0
        # loop through column 3 unless it is nil
        until column_index >= 3
            break if board[column_index][0].nil?
            # loop through the rows in this column
            row_index = 0
            until row_index >= 5
                if board[column_index][row_index] == piece
                    # increase count
                    count = 1
                    # make temporary variables to check up the rows and columns
                    column = column_index + 1
                    row = row_index + 1
                    # check upwards
                    unless board[column][row].nil?
                        while board[column][row] == piece && column <= 6 && row <= 5
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
                        while board[column][row] == piece && column >= 0 && row >= 0
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
            # increase column index
            column_index += 1
        end
        # if the loop never returns true, return false
        return false
    end
end