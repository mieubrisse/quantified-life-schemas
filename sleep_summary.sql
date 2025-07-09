-- updated DDL for the *camel-case → snake-case* field names you just adopted
CREATE TABLE IF NOT EXISTS sleep_summary (
    -- calendar bucket + absolute timestamps
    start_time             TIMESTAMPTZ NOT NULL,          --  "startTime"
    end_time               TIMESTAMPTZ NOT NULL,          --  "endTime"

    sleep_date             DATE        NOT NULL,          --  "date"

    -- raw duration from the API and a convenient INTERVAL
    duration_ms            INTEGER     NOT NULL CHECK (duration_ms >= 0),     -- "durationMs"

    -- overall quality
    efficiency_pct         SMALLINT    NOT NULL CHECK (efficiency_pct BETWEEN 0 AND 100),  -- "efficiencyPct"
    is_main_sleep          BOOLEAN     NOT NULL,

    -- we can get NULL here for naps (non-main sleep)
    deep_minutes           SMALLINT    CHECK (deep_minutes  >= 0),  -- "deepMinutes"
    deep_30d_avg_minutes   SMALLINT    CHECK (deep_30d_avg_minutes >= 0),  -- "deep30dAvgMinutes"

    -- we can get NULL here for naps (non-main sleep)
    light_minutes          SMALLINT    CHECK (light_minutes >= 0),  -- "lightMinutes"
    light_30d_avg_minutes  SMALLINT    CHECK (light_30d_avg_minutes >= 0), -- "light30dAvgMinutes"

    -- we can get NULL here for naps (non-main sleep)
    rem_minutes            SMALLINT    CHECK (rem_minutes  >= 0),   -- "remMinutes"
    rem_30d_avg_minutes    SMALLINT    CHECK (rem_30d_avg_minutes  >= 0), -- "rem30dAvgMinutes"

    wake_minutes           SMALLINT    NOT NULL CHECK (wake_minutes >= 0),   -- "wakeMinutes"
    wake_30d_avg_minutes   SMALLINT             CHECK (wake_30d_avg_minutes >= 0), -- "wake30dAvgMinutes"

    PRIMARY KEY (start_time, end_time)
);

CREATE INDEX IF NOT EXISTS idx_sleep_summary_start_time ON sleep_summary (start_time);
CREATE INDEX IF NOT EXISTS idx_sleep_summary_end_time ON sleep_summary (end_time);
