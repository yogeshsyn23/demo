# typed: strict
# frozen_string_literal: true

class ColumnService

  def modify(dto:)
    dto.data = dto.data.map { |company| company.id = company.id + 1 }
    dto
  end
end