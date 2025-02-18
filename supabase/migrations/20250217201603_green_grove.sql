/*
  # Create clicks table for tracking country-wise clicks

  1. New Tables
    - `clicks`
      - `id` (uuid, primary key)
      - `country` (text, unique)
      - `click_count` (integer)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS on `clicks` table
    - Add policy for public read access
    - Add policy for authenticated service role to update
*/

CREATE TABLE IF NOT EXISTS clicks (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    country text UNIQUE NOT NULL,
    click_count integer DEFAULT 0,
    created_at timestamptz DEFAULT now()
);

ALTER TABLE clicks ENABLE ROW LEVEL SECURITY;

-- Allow public read access to clicks data
CREATE POLICY "Anyone can read clicks data"
    ON clicks
    FOR SELECT
    TO public
    USING (true);

-- Allow service role to update clicks data
CREATE POLICY "Service role can update clicks data"
    ON clicks
    FOR ALL
    TO service_role
    USING (true)
    WITH CHECK (true);