-- Job Application Tracker - Supabase Setup
-- Run this in your Supabase SQL Editor at:
-- https://supabase.com/dashboard/project/nxuxxazxkjdorqfmunmq/sql

CREATE TABLE IF NOT EXISTS job_applications (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  company text NOT NULL,
  role text NOT NULL,
  status text DEFAULT 'Wishlist',
  date_applied date,
  salary text,
  job_url text,
  notes text,
  follow_up_date date,
  created_at timestamp with time zone DEFAULT now()
);

-- Enable Row Level Security (RLS) - optional, adjust as needed
-- ALTER TABLE job_applications ENABLE ROW LEVEL SECURITY;

-- Create policy to allow all operations (for personal use)
-- CREATE POLICY "Allow all" ON job_applications FOR ALL USING (true) WITH CHECK (true);

-- Index for faster status filtering
CREATE INDEX IF NOT EXISTS idx_job_applications_status ON job_applications(status);
CREATE INDEX IF NOT EXISTS idx_job_applications_created_at ON job_applications(created_at DESC);
