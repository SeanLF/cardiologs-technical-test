class Measurement
  WAVE_TYPES = %w[P QRS T INV].freeze
  attr_accessor :wave_type, :wave_onset, :wave_offset, :wave_tags

  def initialize(row)
    @wave_type = row.shift
    @wave_onset = row.shift.to_i
    @wave_offset = row.shift.to_i
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

  def wave_duration
    @wave_offset - @wave_onset
  end
end
