# spec/connect_four_spec.rb

require_relative '../connect_four'

describe ConnectFour do
    test = ConnectFour.new
    describe "check win methods" do
        win_board = [["x", "o", "x", "x"], ["x", "x", "o"], ["o", "o", "x"], ["o", "o", "x", "x", "x", "x"], 
        ["o", "o", "o", "o", "x", "o"], ["x", "o", "o", "o", "x"], ["o", "x", "x", "o", "x", "x"]]
        lose_board = [["o", "o", "x"], ["x", "x", "o"], ["x", "o", "x"], ["o", "x", "x", "o", "o"], 
        ["o", "x", "o", "o", "x", "o"], ["x", "o", "x", "o", "x"], ["o", "x", "x", "x", "o", "o"]]

        describe "check horizontal method" do
            it "can check horizontal wins for 'x'" do
                player_piece = "x"
                expect(test.check_horizontal(player_piece, win_board)).to be(true)
            end
            it "can check horizontal wins for 'o'" do
                player_piece = "o"
                expect(test.check_horizontal(player_piece, win_board)).to be(true)
            end
            it "can check horizontal loss for 'x'" do
                player_piece = "x"
                expect(test.check_horizontal(player_piece, lose_board)).to be(false)
            end
            it "can check horizontal loss for 'o'" do
                player_piece = "o"
                expect(test.check_horizontal(player_piece, lose_board)).to be(false)
            end
        end

        describe "check vertical method" do
            it "can check vertical wins for 'x'" do
                player_piece = "x"
                expect(test.check_vertical(player_piece, win_board)).to be(true)
            end
            it "can check vertical wins for 'o'" do
                player_piece = "o"
                expect(test.check_vertical(player_piece, win_board)).to be(true)
            end
            it "can check vertical loss for 'x'" do
                player_piece = "x"
                expect(test.check_vertical(player_piece, lose_board)).to be(false)
            end
            it "can check vertical loss for 'o'" do
                player_piece = "o"
                expect(test.check_vertical(player_piece, lose_board)).to be(false)
            end
        end

        describe "check diagonal method" do
            it "can check diagonal wins for 'x'" do
                player_piece = "x"
                expect(test.check_diagonal(player_piece, win_board)).to be(true)
            end
            it "can check diagonal wins for 'o'" do
                player_piece = "o"
                expect(test.check_diagonal(player_piece, win_board)).to be(true)
            end
            it "can check diagonal loss for 'x'" do
                player_piece = "x"
                expect(test.check_diagonal(player_piece, lose_board)).to be(false)
            end
            it "can check diagonal loss for 'o'" do
                player_piece = "o"
                expect(test.check_diagonal(player_piece, lose_board)).to be(false)
            end
        end
    end

end