-- Scenario:
-- You are tasked with creating a database for a Social Media Platform.
-- The system needs to track users, friendships, posts, comments, and reactions (likes).
-- Users can make posts, comment on posts, and react (like) to posts.

CREATE DATABASE IF NOT EXISTS SocialMediaDB;
USE SocialMediaDB;

-- Create table to store user information
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(70) UNIQUE,
    DateJoined DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create table to store friendships between users, establishing a many-to-many relationship
CREATE TABLE IF NOT EXISTS Friendships (
    User1ID INT,
    User2ID INT,
    FriendSince DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (User1ID, User2ID),
    FOREIGN KEY (User1ID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (User2ID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create table to store posts made by users
CREATE TABLE IF NOT EXISTS Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    PostContent TEXT NOT NULL,
    PostDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create table to store comments on posts
CREATE TABLE IF NOT EXISTS Comments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    CommentContent TEXT NOT NULL,
    CommentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create table to store reactions (likes) from users on posts
CREATE TABLE IF NOT EXISTS Reactions (
    ReactionID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    ReactionType ENUM('Like', 'Love', 'Haha', 'Wow', 'Sad', 'Angry') DEFAULT 'Like',
    ReactionDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);













