-- Create Database
CREATE DATABASE spotify;
USE spotify;

-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    SubscriptionType VARCHAR(20) NOT NULL
);

-- Artists Table
CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Genre VARCHAR(50)
);

-- Albums Table
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    ArtistID INT,
    ReleaseYear INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID) ON DELETE SET NULL
);

-- Songs Table (Updated with Album relation)
CREATE TABLE Songs (
    SongID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    Duration INT,  -- in seconds
    ReleaseYear INT,
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID) ON DELETE SET NULL
);

-- Playlists Table
CREATE TABLE Playlists (
    PlaylistID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Name VARCHAR(50) NOT NULL,
    Description TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Tracks Table
CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY AUTO_INCREMENT,
    PlaylistID INT,
    SongID INT,
    TrackOrder INT,
    FOREIGN KEY (PlaylistID) REFERENCES Playlists(PlaylistID) ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Songs(SongID) ON DELETE CASCADE
);

-- StreamingHistory Table
CREATE TABLE StreamingHistory (
    StreamID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    SongID INT,
    StreamDate DATE,
    Duration INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Songs(SongID) ON DELETE CASCADE
);

-- SongLikes Table
CREATE TABLE SongLikes (
    LikeID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    SongID INT,
    LikeDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Songs(SongID) ON DELETE CASCADE
);
INSERT INTO Users (Name, Email, SubscriptionType) VALUES
('Alice', 'alice@example.com', 'Premium'),
('Bob', 'bob@example.com', 'Free'),
('Charlie', 'charlie@example.com', 'Premium'),
('David', 'david@example.com', 'Free'),
('Eve', 'eve@example.com', 'Premium'),
('Frank', 'frank@example.com', 'Free'),
('Grace', 'grace@example.com', 'Premium'),
('Hank', 'hank@example.com', 'Free'),
('Ivy', 'ivy@example.com', 'Premium'),
('Jack', 'jack@example.com', 'Free');
INSERT INTO Artists (Name, Genre) VALUES
('Artist A', 'Pop'),
('Artist B', 'Rock'),
('Artist C', 'Hip Hop'),
('Artist D', 'Jazz'),
('Artist E', 'Classical'),
('Artist F', 'Indie'),
('Artist G', 'EDM'),
('Artist H', 'Country'),
('Artist I', 'R&B'),
('Artist J', 'Blues');
INSERT INTO Albums (Title, ArtistID, ReleaseYear) VALUES
('Album A', 1, 2023),
('Album B', 2, 2022),
('Album C', 3, 2021),
('Album D', 4, 2020),
('Album E', 5, 2019),
('Album F', 6, 2023),
('Album G', 7, 2022),
('Album H', 8, 2021),
('Album I', 9, 2020),
('Album J', 10, 2019);
INSERT INTO Songs (Title, Genre, Duration, ReleaseYear, AlbumID) VALUES
('Song A', 'Pop', 210, 2023, 1),
('Song B', 'Rock', 180, 2022, 2),
('Song C', 'Hip Hop', 240, 2021, 3),
('Song D', 'Jazz', 300, 2020, 4),
('Song E', 'Classical', 240, 2019, 5),
('Song F', 'Indie', 200, 2023, 6),
('Song G', 'EDM', 230, 2022, 7),
('Song H', 'Country', 220, 2021, 8),
('Song I', 'R&B', 260, 2020, 9),
('Song J', 'Blues', 280, 2019, 10);
INSERT INTO Playlists (UserID, Name, Description) VALUES
(1, 'Pop Hits', 'Top Pop tracks to vibe to'),
(2, 'Rock Legends', 'Classic rock bangers'),
(3, 'Hip Hop Vibes', 'Fresh Hip Hop tracks'),
(4, 'Smooth Jazz', 'Relaxing jazz selection'),
(5, 'Classical Essentials', 'Timeless classical pieces'),
(6, 'Indie Mix', 'Best of Indie music'),
(7, 'EDM Boost', 'High energy EDM playlist'),
(8, 'Country Roads', 'Country classics'),
(9, 'Soulful R&B', 'Smooth R&B for calm moods'),
(10, 'Blues Nights', 'Late night blues collection');
INSERT INTO Tracks (PlaylistID, SongID, TrackOrder) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);
INSERT INTO StreamingHistory (UserID, SongID, StreamDate, Duration) VALUES
(1, 1, '2025-04-15', 210),
(2, 2, '2025-04-14', 180),
(3, 3, '2025-04-13', 240),
(4, 4, '2025-04-12', 300),
(5, 5, '2025-04-11', 240),
(6, 6, '2025-04-10', 200),
(7, 7, '2025-04-09', 230),
(8, 8, '2025-04-08', 220),
(9, 9, '2025-04-07', 260),
(10, 10, '2025-04-06', 280);
INSERT INTO SongLikes (UserID, SongID, LikeDate) VALUES
(1, 1, '2025-04-15'),
(2, 2, '2025-04-14'),
(3, 3, '2025-04-13'),
(4, 4, '2025-04-12'),
(5, 5, '2025-04-11'),
(6, 6, '2025-04-10'),
(7, 7, '2025-04-09'),
(8, 8, '2025-04-08'),
(9, 9, '2025-04-07'),
(10, 10, '2025-04-06');


-- Query 1: Total streams and duration per song
SELECT Songs.Title, COUNT(StreamingHistory.StreamID) AS TotalStreams, 
       SUM(StreamingHistory.Duration) AS TotalDuration
FROM StreamingHistory
JOIN Songs ON StreamingHistory.SongID = Songs.SongID
GROUP BY Songs.Title
ORDER BY TotalStreams DESC;

-- Query 2: Top 5 most liked songs per genre
SELECT Genre, Title, TotalLikes
FROM (
    SELECT Songs.Genre, Songs.Title, COUNT(SongLikes.LikeID) AS TotalLikes,
           RANK() OVER (PARTITION BY Songs.Genre ORDER BY COUNT(SongLikes.LikeID) DESC) AS genre_rank
    FROM SongLikes
    JOIN Songs ON SongLikes.SongID = Songs.SongID
    GROUP BY Songs.Genre, Songs.Title
) AS ranked
WHERE genre_rank <= 5;

-- Query 3: Users with > 3 hours stream time
SELECT Users.Name, SUM(StreamingHistory.Duration) / 60 AS TotalHours
FROM StreamingHistory
JOIN Users ON StreamingHistory.UserID = Users.UserID
GROUP BY Users.Name
HAVING SUM(StreamingHistory.Duration) > 180;

-- Query 4: Users who streamed all songs from 'Album A'
SELECT Users.Name
FROM StreamingHistory
JOIN Users ON StreamingHistory.UserID = Users.UserID
JOIN Songs ON StreamingHistory.SongID = Songs.SongID
JOIN Albums ON Songs.AlbumID = Albums.AlbumID
WHERE Albums.Title = 'Album A'
GROUP BY Users.UserID, Users.Name
HAVING COUNT(DISTINCT Songs.SongID) = (
    SELECT COUNT(*) FROM Songs WHERE AlbumID = (
        SELECT AlbumID FROM Albums WHERE Title = 'Album A'
    )
);

-- Query 5: Users who liked ≥5 songs from each playlist they created
SELECT DISTINCT u.Name, p.Name AS PlaylistName
FROM Users u
JOIN Playlists p ON u.UserID = p.UserID
JOIN Tracks t ON p.PlaylistID = t.PlaylistID
JOIN Songs s ON t.SongID = s.SongID
JOIN SongLikes sl ON sl.UserID = u.UserID AND sl.SongID = s.SongID
GROUP BY u.UserID, u.Name, p.PlaylistID, p.Name
HAVING COUNT(DISTINCT sl.SongID) >= 5;

-- Query 6: Users who liked all songs from the playlists they're in
SELECT u.Name, p.Name AS PlaylistName, COUNT(sl.LikeID) AS TotalLikes
FROM Users u
JOIN Playlists p ON u.UserID = p.UserID
JOIN Tracks t ON p.PlaylistID = t.PlaylistID
JOIN Songs s ON t.SongID = s.SongID
LEFT JOIN SongLikes sl ON sl.UserID = u.UserID AND sl.SongID = s.SongID
GROUP BY u.UserID, u.Name, p.PlaylistID, p.Name
HAVING COUNT(sl.SongID) = (SELECT COUNT(*) FROM Tracks WHERE PlaylistID = p.PlaylistID);

-- Query 7: Most popular genre based on stream count
SELECT Songs.Genre, COUNT(StreamingHistory.StreamID) AS TotalStreams
FROM StreamingHistory
JOIN Songs ON StreamingHistory.SongID = Songs.SongID
GROUP BY Songs.Genre
ORDER BY TotalStreams DESC
LIMIT 1;

-- Query 8: Users who never liked a song
SELECT Users.Name
FROM Users
LEFT JOIN SongLikes ON Users.UserID = SongLikes.UserID
WHERE SongLikes.LikeID IS NULL;

-- Query 9: Average song duration per genre
SELECT Genre, AVG(Duration) AS AvgDuration
FROM Songs
GROUP BY Genre
ORDER BY AvgDuration DESC;
-- Query 10: Top 3 users by playlist count
SELECT Users.Name, COUNT(Playlists.PlaylistID) AS TotalPlaylists
FROM Playlists
JOIN Users ON Playlists.UserID = Users.UserID
GROUP BY Users.UserID, Users.Name
ORDER BY TotalPlaylists DESC
LIMIT 3;
