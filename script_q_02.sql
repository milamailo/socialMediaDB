-- Find all friends of a user.
use socialmediadb;

set @uid = 1;

SELECT Users.Username, Users.FirstName, Users.LastName
FROM Friendships
JOIN Users ON (Friendships.User2ID = Users.UserID OR Friendships.User1ID = Users.UserID)
WHERE (Friendships.User1ID = @uid OR Friendships.User2ID = @uid)
AND Users.UserID != @uid;
