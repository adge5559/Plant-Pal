-- Drop if table exists
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS posttags;
DROP TABLE IF EXISTS comments;
--SAMPLE
DROP TABLE IF EXISTS plants;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    username text PRIMARY KEY,
    password text NOT NULL,
    profilepicture text DEFAULT '/images/ProfilePicture/7.webp',
    bio text
);

-- Create posts table
CREATE TABLE IF NOT EXISTS posts(
	postid SERIAL PRIMARY KEY,
    username text NOT NULL,
    title text NOT NULL,
    descriptions TEXT NOT NULL,
    titleimgp text,
    titleimgbase text,
    likes INT NOT NULL DEFAULT 0,
    users_who_liked text[],
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastupdatetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES users(username)
);

-- Create sections table
CREATE TABLE IF NOT EXISTS sections(
	sectionid  SERIAL PRIMARY KEY,
    sectiontitle VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    imgpath VARCHAR(60),
    img BYTEA,
    postid INT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (postid) REFERENCES posts(postid)
);

-- Create tags table
CREATE TABLE IF NOT EXISTS tags(
	tagid SERIAL PRIMARY KEY,
    tagname VARCHAR(50) UNIQUE
);

-- Create posttags table (associate posts and tags)
CREATE TABLE IF NOT EXISTS posttags(
	postid INT,
    tagid INT,
	FOREIGN KEY (postid) REFERENCES posts(postid),
    FOREIGN KEY (tagid) REFERENCES tags(tagid)
);

-- Create comments table
CREATE TABLE IF NOT EXISTS comments (
    commentid SERIAL PRIMARY KEY,
    postid INT,
    username VARCHAR(255) NOT NULL,
    commenttext TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES users(username),
    FOREIGN KEY (postid) REFERENCES posts(postid)
);
-- Create table for plants for post SAMPLE
CREATE TABLE IF NOT EXISTS plants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  imagepath VARCHAR(255) NOT NULL
);
