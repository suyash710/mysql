
#Sid 

#Creates unique index for users and groups

DELETE n1 FROM user_group_members n1, user_group_members n2 WHERE n1.id > n2.id AND n1.ukid = n2.ukid and n1.group_id = n2.group_id;

ALTER TABLE `user_group_members` 
ADD UNIQUE INDEX `unique_user_group` (`group_id` ASC, `ukid` ASC);