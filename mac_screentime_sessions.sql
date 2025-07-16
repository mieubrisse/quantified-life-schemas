CREATE TABLE IF NOT EXISTS mac_screentime_sessions (
    ts         TIMESTAMPTZ   PRIMARY KEY,    -- the exact event start time
    duration_s INTEGER       NOT NULL        -- event length in seconds
);

-- We don't need an index because our ts already has a B-key and supports nice ranges
-- Querying data for a specific data is as simple as WHERE ts >= DATE '2025-07-16' AND ts < DATE '2025-07-17'
