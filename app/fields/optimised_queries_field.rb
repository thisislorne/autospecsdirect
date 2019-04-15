require "administrate/field/base"

class OptimisedQueriesField < Administrate::Field::Base
  def to_s
    data
  end
  def to_graph
    data
  end
end
