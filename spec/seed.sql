TRUNCATE TABLE posts, comments RESTART IDENTITY;


INSERT INTO posts (title, content) VALUES 
('Why Walking is Good for Your Health', 'Boost your mood and reduce stress.'),
('The Benefits of Meditation', 'Increase focus and reduce anxiety.'),
('How to Improve Your Productivity', 'Manage your time and stay organized.'),
('Tips for Better Sleep', 'Create a comfortable sleep environment.'),
('10 Easy Recipes for a Busy Week', 'Quick and healthy meal ideas for on-the-go.');

INSERT INTO comments (name, comment, post_id) VALUES 
('Emma_Johnson', 'Nice post!', '3'),
('Liam_Smith', 'Not bad', '1'),
('Olivia_Garcia', 'Love it!', '2'),
('William_Taylor', 'Disagree', '4'),
('Sophia_Lopez', 'Great advice', '3'),
('Alexander_Davis', 'Good points', '5'),
('Mia_Rodriguez', 'Could be better', '2'),
('Ethan_Hernandez', 'Totally agree', '1'),
('Isabella_Martinez', 'Interesting read', '4'),
('Michael_Gonzalez', 'Needs work', '3'),
('Abigail_Wilson', 'Awesome post!', '5'),
('Daniel_Anderson', 'Helpful tips', '2'),
('Emily_Thomas', 'Not impressed', '1'),
('Benjamin_Jackson', 'Agree 100%', '4'),
('Ava_Miller', 'Enjoyed reading', '3'),
('Jacob_Wright', 'Mixed feelings', '5'),
('Sofia_Moore', 'Great content', '1');