#!/usr/bin/env node

var http = require('http');
var _ = require('lodash');
var express = require('express');
var fs = require('fs');
var path = require('path');
var util = require('util');
var dotenv = require('dotenv')

dotenv.config();

function collect(val, memo) {
  if(val && val.indexOf('.') != 0) val = "." + val;
  memo.push(val);
  return memo;
}

var app = express();
var dir = process.env.DC_DIR;
app.use(express.static(dir)); //app public directory
app.use(express.static(__dirname)); //module directory
var server = http.createServer(app);
server.listen(3000);

app.get('/files', function(req, res) {
 var currentDir =  dir;
 var query = req.query.path || '';
 if (query) currentDir = path.join(dir, query);
 console.log("browsing ", currentDir);
 fs.readdir(currentDir, function (err, files) {
     if (err) {
        throw err;
      }
      var data = [];
      files
      .filter(function (file) {
          return true;
      }).forEach(function (file) {
        try {
                //console.log("processing ", file);
                var isDirectory = fs.statSync(path.join(currentDir,file)).isDirectory();
                if (isDirectory) {
                  data.push({ Name : file, IsDirectory: true, Path : path.join(query, file)  });
                } else {
                  var ext = path.extname(file);
                  // if(program.exclude && _.contains(program.exclude, ext)) {
                  //   console.log("excluding file ", file);
                  //   return;
                  // }       
                  data.push({ Name : file, Ext : ext, IsDirectory: false, Path : path.join(query, file) });
                }

        } catch(e) {
          console.log(e); 
        }        
        
      });
      data = _.sortBy(data, function(f) { return f.Name });
      res.json(data);
  });
});

app.get('/', function(req, res) {
 res.redirect('lib/template.html'); 
});
