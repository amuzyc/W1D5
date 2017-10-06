require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode



  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    #byebug
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if evaluator == :x
      opponent = :o
    else
      opponent = :x
    end
    
    if @board.over?
      if @board.winner == opponent
        return true
      else
        return false
      end
    end

    if evaluator==@next_mover_mark
      return true if children.all?{|node| node.losing_node?(evaluator)}
    else
      return true if children.any?{|node| node.losing_node?(evaluator)}
    end
    false
  end

  def winning_node?(evaluator)
    if @board.over?
      if @board.winner==evaluator
        return true
      else
        return false
      end
    end

    if evaluator==@next_mover_mark
      return true if children.any?{|node| node.winning_node?(evaluator)}
    else
      return true if children.all?{|node| node.winning_node?(evaluator)}
    end

    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    find_valid_moves.each do |move|
      mark = switch_next_mover_mark
      move_pos = move
      board = @board.dup
      board[move] = @next_mover_mark
      children << TicTacToeNode.new(board, mark, move_pos)
    end
    children
  end

  def switch_next_mover_mark
    return :o if @next_mover_mark==:x
    return :x if @next_mover_mark==:o
  end

  def find_valid_moves
    moves = []
    @board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        moves << [row_idx, col_idx] if @board.empty?([row_idx, col_idx])
      end
    end
    moves
  end


end
