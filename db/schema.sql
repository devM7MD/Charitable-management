-- 1. جدول المستخدمين (تم إضافة الرتب، النقاط، المهارات)
CREATE TABLE IF NOT EXISTS Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE,
    fullname TEXT,
    email TEXT UNIQUE,
    passwd_auth TEXT,
    role TEXT DEFAULT 'volunteer', -- 'volunteer', 'organizer', 'admin'
    points INTEGER DEFAULT 0,
    skills_tags TEXT, -- مثال: 'طبخ,سواقة,تصوير'
    phone_number TEXT,
    is_active BOOLEAN DEFAULT 1
);

-- 2. جدول الحملات (تم إضافة التصنيف، الحالة، الصورة)
CREATE TABLE IF NOT EXISTS Campaigns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    organizer_id INTEGER,
    title TEXT,
    description TEXT,
    category TEXT, -- مثال: 'إطعام', 'طبي', 'تعليم'
    status TEXT DEFAULT 'draft', -- 'draft', 'active', 'completed'
    location TEXT,
    event_date DATE,
    image_url TEXT,
    FOREIGN KEY (organizer_id) REFERENCES Users(id)
);

-- 3. جدول المهام (تم إضافة الصعوبة، النقاط، الساعات المقدرة)
CREATE TABLE IF NOT EXISTS Tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    campaign_id INTEGER,
    task_name TEXT,
    task_descriptions TEXT,
    status TEXT DEFAULT 'pending', -- 'pending', 'in_progress', 'completed'
    difficulty_level TEXT, -- 'easy', 'medium', 'hard'
    points_reward INTEGER DEFAULT 10,
    required_skills TEXT,
    estimated_hours INTEGER,
    assigned_to INTEGER, -- بيفضل فاضي لحد ما المنظم يقبل متطوع
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(id),
    FOREIGN KEY (assigned_to) REFERENCES Users(id)
);

-- 4. جدول التقديمات (الكوبري الجديد: المتطوع بيقدم على مهمة ويستنى الموافقة)
CREATE TABLE IF NOT EXISTS Applications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    task_id INTEGER,
    volunteer_id INTEGER,
    application_status TEXT DEFAULT 'pending', -- 'pending', 'accepted', 'rejected'
    applied_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (task_id) REFERENCES Tasks(id),
    FOREIGN KEY (volunteer_id) REFERENCES Users(id)
);

-- 5. جدول الشهادات (نظام المكافآت)
CREATE TABLE IF NOT EXISTS Certificates (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    volunteer_id INTEGER,
    issue_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_hours INTEGER,
    certificate_url TEXT,
    FOREIGN KEY (volunteer_id) REFERENCES Users(id)
);