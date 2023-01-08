const cron = require("node-cron");
const fs = require("fs");
const uploadFiles = require("./aws-bucket");


const date = function() {
    cron.schedule("* * * * *", () =>
    fs.writeFile("Cronjob.txt", new Date().toLocaleString(), (err) => {
    uploadFiles();
    console.log("Created File");
  })
    )
}

module.exports = date;