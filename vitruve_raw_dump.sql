-- SET datestyle = 'DMY';  -- if CSV dates are like 01/08/2025

CREATE TABLE IF NOT EXISTS vitruve_raw_dump (
    -- identity and context
    email TEXT,
    athlete TEXT,
    last_name TEXT,
    exercise TEXT,

    -- session timing
    workout_date DATE,           -- e.g., 01/08/2025 (in UTC time)
    repetition_time TIME,        -- e.g., 16:12:14  (rep time, in UTC time)

    -- set/rep details
    num_set INTEGER,             -- "# Set"
    num_rep INTEGER,             -- "# Rep."
    type TEXT,                   -- "Type*"

    -- strength & velocity metrics
    one_rm_kg DOUBLE PRECISION,                           -- "1RM (kg)"
    one_rm_per_body_weight_pct DOUBLE PRECISION,          -- "1RM / Body Weight (%)"
    acceleration_index_m_s2 DOUBLE PRECISION,             -- "Acceleration Index (m/s2)"

    fatigue_pv_pct DOUBLE PRECISION,                      -- "Fatigue (PV) (%)"
    fatigue_mpv_pct DOUBLE PRECISION,                     -- "Fatigue [MPV] (%)"
    fatigue_mv_pct DOUBLE PRECISION,                      -- "Fatigue [MV] (%)"

    mean_acceleration_m_s2 DOUBLE PRECISION,              -- "Mean Acceleration (m/s2)"
    mean_force_n DOUBLE PRECISION,                        -- "Mean Force (N)"
    mean_force_per_body_weight_n_kg DOUBLE PRECISION,     -- "Mean Force / Body Weight (N/kg)"

    mean_power_mpv_w DOUBLE PRECISION,                    -- "Mean Power [MPV] (W)"
    mean_power_mv_w DOUBLE PRECISION,                     -- "Mean Power [MV] (W)"
    mean_power_per_body_weight_mpv_w_kg DOUBLE PRECISION, -- "Mean Power / Body Weight [MPV] (w/kg)"
    mean_power_per_body_weight_mv_w_kg DOUBLE PRECISION,  -- "Mean Power / Body Weight [MV] (w/kg)"

    mean_propulsive_velocity_m_s DOUBLE PRECISION,        -- "Mean Propulsive Velocity (m/s)"
    mean_velocity_m_s DOUBLE PRECISION,                   -- "Mean Velocity (m/s)"

    peak_acceleration_m_s2 DOUBLE PRECISION,              -- "Peak Acceleration (m/s2)"
    peak_force_n DOUBLE PRECISION,                        -- "Peak Force (N)"
    peak_force_per_body_weight_n_kg DOUBLE PRECISION,     -- "Peak Force / Body Weight (N/kg)"
    peak_power_w DOUBLE PRECISION,                        -- "Peak Power (W)"
    peak_power_per_body_weight_w_kg DOUBLE PRECISION,     -- "Peak Power / Body Weight (w/kg)"
    peak_velocity_m_s DOUBLE PRECISION,                   -- "Peak Velocity (m/s)"
    peak_velocity_per_body_weight_m_s_kg DOUBLE PRECISION,-- "Peak Velocity / Body Weight (m/s/kg)"

    repetition_duration_ms DOUBLE PRECISION,              -- "Repetition Duration (ms)"
    rom_range_of_motion_m DOUBLE PRECISION,               -- "ROM (Range of Motion) (m)"
    time_to_peak_velocity_ms DOUBLE PRECISION,            -- "Time to Peak Velocity (ms)"

    weight_kg DOUBLE PRECISION,                           -- "Weight (kg)"
    weight_per_body_weight_pct DOUBLE PRECISION,          -- "Weight / Body Weight (%)"

    -- composite primary key for de-dup & upserts
    PRIMARY KEY (email, athlete, last_name, exercise, workout_date, repetition_date, num_set, num_rep, type)
);
