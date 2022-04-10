CREATE TABLE IF NOT EXISTS months(
        month_id INTEGER PRIMARY KEY,
        year INTEGER,
        month INTEGER
    );

CREATE TABLE IF NOT EXISTS quarters(
        quarter_id INTEGER PRIMARY KEY,
        year INTEGER,
        quarter INTEGER
    );

CREATE TABLE IF NOT EXISTS monthly_asm(
        asm_id INTEGER PRIMARY KEY,
        asm_month_id INTEGER REFERENCES months(month_id) ON DELETE CASCADE,
        domestic_asm INTEGER NOT NULL DEFAULT 0,
        international_asm INTEGER NOT NULL DEFAULT 0,
        total_asm INTEGER NOT NULL DEFAULT 0,
        UNIQUE(asm_id, asm_month_id)
    );

CREATE TABLE IF NOT EXISTS monthly_rpm(
        rpm_id INTEGER PRIMARY KEY,
        rpm_month_id INTEGER REFERENCES months(month_id) ON DELETE CASCADE,
        domestic_rpm INTEGER NOT NULL DEFAULT 0,
        international_rpm INTEGER NOT NULL DEFAULT 0,
        total_rpm INTEGER NOT NULL DEFAULT 0,
        UNIQUE(rpm_id, rpm_month_id)
    );

CREATE TABLE IF NOT EXISTS monthly_plf(
        asm_id INTEGER REFERENCES monthly_asm(asm_id) ON DELETE CASCADE,
        rpm_id INTEGER REFERENCES monthly_rpm(rpm_id) ON DELETE CASCADE,
        domestic_plf NUMERIC NOT NULL DEFAULT 0.00,
        international_plf NUMERIC NOT NULL DEFAULT 0.00,
        total_plf NUMERIC NOT NULL DEFAULT 0.00,
        PRIMARY KEY(asm_id, rpm_id)
    );

CREATE TABLE IF NOT EXISTS monthly_passengers(
        monthly_passengers_id INTEGER PRIMARY KEY,
        passengers_month_id INTEGER REFERENCES months(month_id) ON DELETE CASCADE,
        domestic_passengers INTEGER NOT NULL DEFAULT 0,
        international_passengers INTEGER NOT NULL DEFAULT 0,
        total_passengers INTEGER NOT NULL DEFAULT 0,
        UNIQUE(monthly_passengers_id, passengers_month_id)
    );

CREATE TABLE IF NOT EXISTS monthly_flights(
        monthly_flights_id INTEGER PRIMARY KEY,
        flights_month_id INTEGER REFERENCES months(month_id) ON DELETE CASCADE,
        domestic_flights INTEGER NOT NULL DEFAULT 0, 
        international_flights INTEGER NOT NULL DEFAULT 0,
        total_rpm INTEGER NOT NULL DEFAULT 0,
        UNIQUE(monthly_flights_id, flights_month_id)
    );

CREATE TABLE IF NOT EXISTS monthly_netincome(
        monthly_netincome_id INTEGER PRIMARY KEY,
        netincome_quarter_id INTEGER REFERENCES quarters(quarter_id) ON DELETE CASCADE,
        domestic_netincome INTERGER NOT NULL DEFAULT 0, 
        latinamerica_netincome INTEGER NOT NULL DEFAULT 0,
        atlantic_netincome INTEGER NOT NULL DEFAULT 0,
        pacific_netincome INTEGER NOT NULL DEFAULT 0,
        total_netincome INTEGER NOT NULL DEFAULT 0,
        UNIQUE(monthly_netincome_id, netincome_quarter_id )
    );

CREATE TABLE IF NOT EXISTS monthly_or(
        monthly_or_id INTEGER PRIMARY KEY,
        or_quarter_id INTEGER REFERENCES quarters(quarter_id) ON DELETE CASCADE,
        domestic_or INTEGER NOT NULL DEFAULT 0, 
        latinamerica_or INTEGER NOT NULL DEFAULT 0,
        atlantic_or INTEGER NOT NULL DEFAULT 0,
        pacific_or INTEGER NOT NULL DEFAULT 0,
        total_or INTEGER NOT NULL DEFAULT 0,
        UNIQUE(monthly_or_id, or_quarter_id )
    );