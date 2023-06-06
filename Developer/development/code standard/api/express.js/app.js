var express = require('express');
const fileUpload = require('express-fileupload');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var timeout = require('connect-timeout');

var logger = require('morgan');
var cors = require('cors');

const config = require('./configs/app');

var app = express();
app.use(timeout('1000s'));
// Middleware
require('./configs/middleware');

// allow cors
app.use(cors());
app.use((req, res, next) => {
  res.append('Vary', 'Origin');
  next();
});
app.use(fileUpload());
app.use(logger('dev'));
app.use(bodyParser.json({ limit: '4gb' }));
app.use(bodyParser.urlencoded({ limit: '4gb', extended: true }));
app.use(cookieParser());
app.use(function (req, res, next) {
  if (!req.timedout) next();
});

// app.use(function (req, res, next) {
//     res.vary('Origin').send('Origin added to the Vary response header');
//     next();
// });

// app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocs));
app.use(require('./routes'));

require('./configs/errorHandler')(config.isProduction, app);

app.listen(config.port, () => {
  console.log(`
    Port: ${config.port}
    Env: ${app.get('env')}
  `);
});

module.exports = app;
