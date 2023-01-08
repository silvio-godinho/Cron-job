const AWS = require('aws-sdk');
const fs = require('fs')
const filename = 'Cronjob.txt'
const fileContent = fs.readFileSync(filename)
var s3 = new AWS.S3({
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
    region: process.env.AWS_REGION
  })
const uploadFileAws = function (){

    var params = {
        Bucket: process.env.AWS_BUCKET_NAME,
        Key: `${filename}`,
        Body: fileContent
      }
    s3.upload(params).promise()

}

module.exports = uploadFileAws;
