-- Find all comments on a specific post.
use socialmediadb;

set @pid = 1;

SELECT Comments.CommentContent, Users.Username
FROM Comments
JOIN Users ON Comments.UserID = Users.UserID
WHERE Comments.PostID = @pid;