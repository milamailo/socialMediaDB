-- Query to find mutual friends between two users (find common friends of User1 and User2).
use socialmediadb;

set @uid_1 = 1;
set @uid_2 = 2;

SELECT u.email, u.UserID, f1.User2ID
FROM Users u
JOIN Friendships f1 ON (u.UserID = f1.User2ID AND f1.User1ID = @uid_1)
JOIN Friendships f2 ON (u.UserID = f2.User2ID AND f2.User1ID = @uid_2)
WHERE u.UserID NOT IN (@uid_1, @uid_2);

