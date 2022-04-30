const express = require('express');
const bodyParser = require('body-parser');
const db = require('../db/index.js');
const { getQuestions, getAnswers, postQuestion, postAnswer, markQuestion, markAnswer, reportQuestion, reportAnswer } = require('./controllers.js');

const PORT = 3000;
const app = express();

app.use(bodyParser.json());



//question list
app.get('/qa/questions', getQuestions);

//answer list
app.get('/qa/questions/:question_id/answers', getAnswers);

//add question
app.post('/qa/questions', postQuestion);

//add answer
app.post('/qa/questions/:question_id/answers', postAnswer);

//mark question as helpful
app.put('/qa/questions/:question_id/helpful', markQuestion);

//mark answer as helpful
app.put('/qa/answers/:answer_id/helpful', markAnswer);

//report question
app.put('/qa/questions/:question_id/report', reportQuestion);

//report answer
app.put('/qa/answers/:answer_id/report', reportAnswer);



app.listen(PORT, () =>
  console.log(`The SDC is running on: http://localhost:${PORT}.`)
);