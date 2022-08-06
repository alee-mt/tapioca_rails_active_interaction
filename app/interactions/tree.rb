# typed: true
# frozen_string_literal: true

class Tree < ApplicationInteraction
  string :path, default: "/"
  string :pattern, default: ".*"
  integer :max_paths, default: nil

  def execute
    paths = []
  end
end
