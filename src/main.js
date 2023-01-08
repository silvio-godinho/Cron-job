const express = require("express");
const dataCron = require ("./cronjob")

app = express();

  dataCron();

  app.listen(process.env.PORT || 3333, function () {
    console.log(`Server is Running on port 3333 `);
  });