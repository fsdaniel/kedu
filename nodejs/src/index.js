var express = require('express');
var app = express();

app.get('/', function(req, res){
   res.send("Hello world!");
});

app.get('/test', function(req, res){
   res.send("Route /test works!!");
});

app.listen(3000);
console.log('Serving from 3000');
