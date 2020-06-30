class Measurement
  WAVE_TYPES = %w[P QRS T INV].freeze
  attr_accessor :wave_type, :wave_onset, :wave_offset, :wave_tags

  def initialize(row)
    @wave_type = row.shift
    @wave_onset = row.shift
    @wave_offset = row.shift
    @wave_tags = row
  end

  def p_wave?
    @wave_type == 'P'
  end

  def qrs_wave?
    @wave_type == 'P'
  end

  def t_wave?
    @wave_type == 'T'
  end

  def inv_wave?
    @wave_type == 'INV'
  end
end