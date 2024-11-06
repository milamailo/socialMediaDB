-- Find the most active user based on the number of posts.
use socialmediadb;

SELECT Users.email, COUNT(Posts.PostID) AS TotalPosts
FROM Users
JOIN Posts ON Users.UserID = Posts.UserID
GROUP BY Users.UserID
ORDER BY TotalPosts DESC
LIMIT 1;
