# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  @data = []

  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    lines = tsv.split("\n")
    keys = lines.shift.split
    @data = lines.map do |line|
      values = line.split("\t").map(&:chomp)
      keys.zip(values).to_h
    end
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    headers = @data[0].keys.join("\t")
    rows = @data.map { |row| row.values.join("\t") }
    "#{([headers] + rows).join("\n")}\n"
  end
end
