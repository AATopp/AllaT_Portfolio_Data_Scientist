-- Find the number of posts which were reacted to with a like.

select COUNT(distinct fp.post_id) as n_posts
from facebook_reactions fr 
     JOIN facebook_posts fp
     ON fp.post_id = fr.post_id
WHERE fr.reaction = 'like'
