TRUNCATE TABLE user_accounts, posts RESTART IDENTITY; 
-- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO user_accounts (email_address, username) VALUES ('fake@fake.com', 'dave_franks');
INSERT INTO user_accounts (email_address, username) VALUES ('definitelyfake@fake.com', 'mick_franks');