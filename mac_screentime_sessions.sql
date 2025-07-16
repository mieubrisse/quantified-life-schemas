CREATE TABLE mac_screentime_sessions (
    ts         TIMESTAMPTZ   PRIMARY KEY,    -- the exact event start time
    duration_s INTEGER       NOT NULL        -- event length in seconds
);

CREATE INDEX idx_session_durations_ts_date
    ON session_durations ((ts::date));
