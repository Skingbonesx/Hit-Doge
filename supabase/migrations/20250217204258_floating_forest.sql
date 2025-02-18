/*
  # Update clicks table policies

  1. Changes
    - Add policy for public insert access
    - Add policy for public update access
    
  2. Security
    - Allow public to insert and update clicks data
*/

-- Allow public to insert clicks data
CREATE POLICY "Anyone can insert clicks data"
    ON clicks
    FOR INSERT
    TO public
    WITH CHECK (true);

-- Allow public to update clicks data
CREATE POLICY "Anyone can update clicks data"
    ON clicks
    FOR UPDATE
    TO public
    USING (true)
    WITH CHECK (true);