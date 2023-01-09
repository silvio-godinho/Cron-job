const cron = require("node-cron");
const fs = require("fs");
const uploadFiles = require("./aws-bucket");


const date = function() {
    cron.schedule("0 */1 * * *", () =>
    fs.writeFile("Cronjob.txt", new Date().toLocaleString(), (err) => {
    uploadFiles();
    console.log("Created File");
  })
    )
}

module.exports = date;