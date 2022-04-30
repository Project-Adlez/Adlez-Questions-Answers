
\c sdc

COPY questions(id, product_id, question_body, question_date, asker_name, question_email, question_reported, question_helpfulness)
FROM '/Users/tim/Documents/HackReactor/SDC-Questions-Answers/csvData/questions.csv'
DELIMITER ','
CSV HEADER;


COPY answers(id, question_id, answer_body, answer_date, answer_name, answer_email, answer_reported, answer_helpfulness)
FROM '/Users/tim/Documents/HackReactor/SDC-Questions-Answers/csvData/answers.csv'
DELIMITER ','
CSV HEADER;

COPY photos(id, answer_id, photos_url)
FROM '/Users/tim/Documents/HackReactor/SDC-Questions-Answers/csvData/answers_photos.csv' DELIMITER ','
CSV HEADER;

SELECT setval('questions_id_seq', (SELECT MAX(id) FROM questions)+1);
SELECT setval('answers_id_seq', (SELECT MAX(id) FROM answers)+1);
SELECT setval('photos_id_seq', (SELECT MAX(id) FROM photos)+1);

