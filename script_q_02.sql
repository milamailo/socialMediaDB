-- Find all friends of a user.
USE socialmediadb;

SET @uid = 1;

SELECT U.Username, U.FirstName, U.LastName
FROM Users U
JOIN Friendships F ON (F.User1ID = U.UserID OR F.User2ID = U.UserID)
WHERE (F.User1ID = @uid OR F.User2ID = @uid)
AND U.UserID != @uid;

