# spec/connect_four_spec.rb

require_relative '../connect_four'

describe Player do
    describe "create a Player 1" do
        test = Player.new("x", "Player 1")
        it "creates a player with x as the token" do
            expect(test.token).to eql("x")
        end
        it "creates a player with Player 1 as the name" do
            expect(test.name).to eql("Player 1")
        end
    end
    describe "create Player 2" do
        test = Player.new("o", "Player 2")
        it "creates a player with o as the token" do
            expect(test.token).to eql("o")
        end
        it "creates a player with Player 2 as the name" do
            expect(test.name).to eql("Player 2")
        end
    end
end
describe ConnectFour do
    test = ConnectFour.new
    describe "check game over methods" do
        win_board = [["x", "o", "x", "x"], ["x", "x", "o"], ["o", "o", "x"], ["o", "o", "x", "x", "x", "x"], 
        ["o", "o", "o", "o", "x", "o"], ["x", "o", "o", "o", "x"], ["o", "x", "x", "o", "x", "x"]]
        lose_board = [["o", "o", "x"], ["x", "x", "o"], ["x", "o", "x"], ["o", "x", "x", "o", "o"], 
        ["o", "x", "o", "o", "x", "o"], ["x", "o", "x", "o", "x"], ["x", "x", "o", "x", "o", "o"]]

        describe "check horizontal method" do
            it "can check horizontal wins for 'x'" do
                test = ConnectFour.new(win_board)
                player_piece = "x"
                expect(test.check_horizontal(player_piece)).to be(true)
            end
            it "can check horizontal wins for 'o'" do
                test = ConnectFour.new(win_board)
                player_piece = "o"
                expect(test.check_horizontal(player_piece)).to be(true)
            end
            it "can check horizontal loss for 'x'" do
                test = ConnectFour.new(lose_board)
                player_piece = "x"
                expect(test.check_horizontal(player_piece)).to be(false)
            end
            it "can check horizontal loss for 'o'" do
                test = ConnectFour.new(lose_board)
                player_piece = "o"
                expect(test.check_horizontal(player_piece)).to be(false)
            end
        end

        describe "check vertical method" do
            it "can check vertical wins for 'x'" do
                test = ConnectFour.new(win_board)
                player_piece = "x"
                expect(test.check_vertical(player_piece)).to be(true)
            end
            it "can check vertical wins for 'o'" do
                test = ConnectFour.new(win_board)
                player_piece = "o"
                expect(test.check_vertical(player_piece)).to be(true)
            end
            it "can check vertical loss for 'x'" do
                test = ConnectFour.new(lose_board)
                player_piece = "x"
                expect(test.check_vertical(player_piece)).to be(false)
            end
            it "can check vertical loss for 'o'" do
                test = ConnectFour.new(lose_board)
                player_piece = "o"
                expect(test.check_vertical(player_piece)).to be(false)
            end
        end

        describe "check diagonal method" do
            it "can check diagonal wins for 'x'" do
                test = ConnectFour.new(win_board)
                player_piece = "x"
                expect(test.check_diagonal(player_piece)).to be(true)
            end
            it "can check diagonal wins for 'o'" do
                test = ConnectFour.new(win_board)
                player_piece = "o"
                expect(test.check_diagonal(player_piece)).to be(true)
            end
            it "can check diagonal loss for 'x'" do
                test = ConnectFour.new(lose_board)
                player_piece = "x"
                expect(test.check_diagonal(player_piece)).to be(false)
            end
            it "can check diagonal loss for 'o'" do
                test = ConnectFour.new(lose_board)
                player_piece = "o"
                expect(test.check_diagonal(player_piece)).to be(false)
            end
        end

        describe "check game won method" do
            it "returns true when a submethod returns true" do
                test = ConnectFour.new(win_board)
                expect(test.game_won?(test.player_1)).to be(true)
            end
            it "returns false when no submethod returns true" do
                test = ConnectFour.new(lose_board)
                expect(test.game_won?(test.player_2)).to be(false)
            end
        end

        describe "check board full m---ethod" do
            it "returns true if board is full" do
                board = [[1,1,1,1,1,1,], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1,1]]
                test = ConnectFour.new(board)
                expect(test.board_full?).to be(true)
            end
            it "returns false if board is not full" do
                board = [[1,1,1,1,1,1,], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1,1], [1,1,1,1,1]]
                test = ConnectFour.new(board)
                expect(test.board_full?).to be(false)
            end
        end
    end
    describe "create game" do
        it "initializes a game board" do
            expect(test.board.length).to eql(7)
        end
        it "creates a player one" do
            expect(test.player_1).not_to be(nil)
        end
        it "creates a player two" do
            expect(test.player_2).not_to be(nil)
        end
    end
    describe "check input method" do
        it "should return true if input is valid" do
            input = 1
            expect(test.check_input(input)).to be(true)
        end
        it "should return false if input is invalid" do
            input = 9
            expect(test.check_input(input)).to be(false)
        end
    end
    describe "check fill board method" do
        it "returns an array full of '*' in place of the empty spots" do
            test = ConnectFour.new([["x", "o"], ["x", "o"], ["x", "o"], ["x", "o"], ["x", "o"], ["x", "o"], ["x", "o"]])
            solution = [["x", "o", "*", "*", "*", "*"], ["x", "o", "*", "*", "*", "*"], ["x", "o", "*", "*", "*", "*"], ["x", "o", "*", "*", "*", "*"], 
            ["x", "o", "*", "*", "*", "*"], ["x", "o", "*", "*", "*", "*"], ["x", "o", "*", "*", "*", "*"]]
            expect(test.fill_board).to eql(solution)
        end
    end
end
