module MeasurementsHelper
  def premature_p_and_qrs_waves_count(measurements)
    measurements.count { |m| (m.p_wave? || m.qrs_wave?) && m.wave_tags.include?('premature') }
  end

  def mean_heart_rate(measurements)
    measurements.count(&:qrs_wave?).to_f / measurements_duration_in_ms(measurements)
  end

  def min_max_heart_rates(measurements)
    qrs_measurements = measurements.select(&:qrs_wave?)
    {
      min: qrs_measurements.min_by(&:wave_duration),
      max: qrs_measurements.max_by(&:wave_duration)
    }
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
