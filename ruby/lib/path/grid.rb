#!/usr/bin/env ruby
#
# Author: Konstantin Gredeskoul, kig@reinvent.one
# Apple interview question solution
#
# The provided rspec calculates the paths for 5x5 grid. However, this solution
# can compute this value for non-square grids just the same.
#
# To run this solution, save this file on your file system
# as grid.rb and then run in the same folder:
#
#      gem install rspec --no-ri --no-rdoc
#      ruby grid.rb
#
#
# You should see the following output:
#
# ❯ ruby grid.rb
#
# Path::Grid
#   Getters and Setters
#     #[]
#       should initialize with zeros
#       should return 0 when X is out of range
#       should return 0 when Y is out of range
#     #[]=
#       should initialize with zeros
#   Path Finder
#     without blocked cells
#       should compute a total number of available paths
#       should return the last value as #num_paths
#     with some cells blocked
#       should return the last value as #num_paths
#     when the final corner is unreachable
#       should have a total number of paths set to zero
#     #inspect
#  ━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ⃒    1    1    1    1    1 ⃒
#  ⃒    1    2    3    4    5 ⃒
#  ⃒    1    3    6   10   15 ⃒
#  ⃒    1    4   10   20   35 ⃒
#  ⃒    1    5   15   35   70 ⃒
#  ━━━━━━━━━━━━━━━━━━━━━━━━━━
#       should print the numbers to a string
#
# Finished in 0.00866 seconds (files took 0.07554 seconds to load)
# 9 examples, 0 failures
#
module Path
  # ### Problem
  #
  # Find a number of unique paths on a W x H grid from 1,1 to W,H
  # assuming some cells may not be passable. We can only move in two
  # directions: down and right.
  #
  # We solve this by observing that for each non-blocked cell, the total
  # number of paths is necessarily a sum of paths of the cell immediately
  # following the chosen cell, in each allowed dimension.
  #
  # So we reverse the direction for convenience (the total does not change)
  # and start with 1 @ [0,0], and keep filling out the matrix until we get
  # to the end.
  #
  # In the case where we have a set of blocked cells, we simply fill them
  # out with zeros, since no path can go through it, and algorithm takes care
  # of the rest.
  class Grid
    attr_reader :width, :height, :blocked_cells
    attr_reader :cells

    def initialize(width, height, blocked_cells = [])
      @width         = width
      @height        = height
      @blocked_cells = blocked_cells
      @cells         = Array.new(width * height) { 0 }

      populate!
    end

    # Getter
    def [](x, y)
      in_range?(x, y) ? cells[index(x, y)] : 0
    end

    # Setter
    def []=(x, y, value)
      return unless in_range?(x, y)
      cells[index(x, y)] = value
    end

    # Assuming the matrix has already been populated, just return the very last
    # value in the corner.
    def num_paths
      @num_paths ||= begin
        self[width - 1, height - 1]
      end
    end

    def inspect
      GridFormatter.new(self).format
    end

    def populate!
       for y in (0...height) do
         for x in (0...width) do
           compute_cell(x, y)
         end
       end
     end

    private

    def compute_cell(x, y)
      if x + y == 0
        # seed the very first cell
        self[x, y] = 1
      else
        if blocked_cells.include?([x, y])
          # set this cell to zero, since nothing can come through it
          self[x, y] = 0
        else
          # otherwise we sum the number of paths from the two cells leading
          self[x, y] = self[x - 1, y] + self[x, y - 1]
        end
      end
    end

    def index(x, y)
      x + height * y
    end

    def y_in_range?(y)
      0 <= y && y <= height - 1
    end

    def x_in_range?(x)
      0 <= x && x <= width - 1
    end

    def in_range?(x, y)
      x_in_range?(x) && y_in_range?(y)
    end
  end

  # This is just for pretty formatting of the matrix :)
  # It returns a string buffer that looks like this:
  #  ━━━━━━━━━━━━━━━━━━━━━━━━━━━
  # ⃒    1    1    1    1    1  ⃒
  # ⃒    1    2    3    4    5  ⃒
  # ⃒    1    3    6   10   15  ⃒
  # ⃒    1    4   10   20   35  ⃒
  # ⃒    1    5   15   35   70  ⃒
  #  ━━━━━━━━━━━━━━━━━━━━━━━━━━━
  class GridFormatter < Struct.new(:grid)
    attr_accessor :buffer

    def format
      cell_width  = 4
      self.buffer = String.new(capacity: grid.width * grid.height * cell_width)
      buffer << line
      for y in (0...grid.height) do
        buffer << vertical_bar
        for x in (0...grid.width) do
          buffer << sprintf('%*d ', cell_width, grid[x, y])
        end
        buffer << ' ' + vertical_bar + " \n"
      end
      buffer << line
    end

    def vertical_bar
      '⃒ '
    end

    private

    def line
      ' ' + '━' * 5 * grid.width + "━\n"
    end
  end
end

