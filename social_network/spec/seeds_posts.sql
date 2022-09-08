TRUNCATE TABLE user_accounts, posts RESTART IDENTITY;
TRUNCATE TABLE  posts RESTART IDENTITY;



-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO user_accounts (email_address, username) VALUES ('fake@fake.com', 'dave_franks');
INSERT INTO posts (title, content, num_of_views, user_account_id) VALUES ('Monday', 'Today I ate toast', '14', '1');
INSERT INTO posts (title, content, num_of_views, user_account_id) VALUES ('Tuesday', 'Today I took the bins out', '6', '1');