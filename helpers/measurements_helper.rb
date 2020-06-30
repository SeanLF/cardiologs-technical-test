module MeasurementsHelper
  def premature_p_and_qrs_waves_count(measurements)
    measurements.count { |m| (m.p_wave? || m.qrs_wave?) && m.wave_tags.include?('premature') }
  end

  # assumes the file gives one day's worth of measurements
  def mean_heart_rate(measurements)
    measurements.count(&:qrs_wave?).to_f / measurements_duration_in_ms(measurements)
  end

  private

  def measurements_start_ms(measurements)
    measurements.first.wave_onset
  end

  def measurements_end_ms(measurements)
    measurements.last.wave_offset
  end

  def measurements_duration_in_ms(measurements)
    measurements_end_ms(measurements) - measurements_start_ms(measurements)
  end
end
