-- List all posts made by a user, including the number of reactions 
-- each post has received.
use socialmediadb;

set @uid = 1;

SELECT Posts.PostID, Posts.PostContent, COUNT(Reactions.ReactionID) AS ReactionCount
FROM Posts
LEFT JOIN Reactions ON Posts.PostID = Reactions.PostID
WHERE Posts.UserID = @uid
Group by Posts.PostID
