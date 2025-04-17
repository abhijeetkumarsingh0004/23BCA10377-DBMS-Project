# 23BCA10377-DBMS-Project
Spotify-Like Music Streaming Database Project

This project is a comprehensive **MySQL relational database model** of a simplified Spotify-like music streaming service. It includes users, artists, albums, songs, playlists, and user interaction features like streaming history and song likes.

---

## 📁 Project Structure

- **Database Schema Design**  
  An optimized schema using proper foreign key relationships and normalization principles.

- **SQL Queries**  
  Analytical queries to gain insights on user behavior, song popularity, genres, etc.

- **Data Insertion**  
  Sample data inserted into all tables with consistent foreign key integrity.

- **ER Diagram**  
  A complete Entity-Relationship diagram showcasing all tables and their relations.

---

## 🧱 Database Tables

- `Users`: Stores user information and subscription details.
- `Artists`: Holds artist profiles.
- `Albums`: Albums created by artists.
- `Songs`: Songs linked to albums.
- `Playlists`: Playlists created by users.
- `Tracks`: Songs added to playlists in specific order.
- `StreamingHistory`: Records user listening activity.
- `SongLikes`: Tracks songs liked by users.

---

## 🔍 Sample Analytical Queries

- Top 5 most liked songs by genre.
- Total streams and total duration per song.
- Most streamed genre.
- Users who streamed >3 hours of music.
- Users who liked all songs in their playlists.
- Users who streamed all songs from a specific album.
- Users who have never liked any song.
- Average song duration per genre.
- Top 3 users with most playlists.

---

## 🧪 Technologies Used

- **MySQL 8.x**
- SQL DDL & DML
- Relational Modeling
- ER Diagram Tools (e.g., dbdiagram.io / draw.io)
