var dotenv = require('dotenv')
var http = require('http');
var httpProxy = require('http-proxy');

dotenv.config();

var dindHost = process.env.DC_DIND_HOST;
var proxy = httpProxy.createProxyServer({ws:true});

var proxyServer = http.createServer(function(req, res) {
  var port = undefined;
  var host = req.headers['host'];
  if (host && (dotIndex=host.indexOf('.')) > 0) {
    port = host.substring(0, dotIndex);
  }
  if (! port) {
    res.statusCode = 404;
    res.statusMessage = 'Not Found';
    return res.end();
  }
  proxy.web(req, res, { target: 'http://'+dindHost+':'+port });
});

proxyServer.on('upgrade', function (req, socket, head) {
  var port = undefined;
  var host = req.headers['host'];
  if (host && (dotIndex=host.indexOf('.')) > 0) {
    port = host.substring(0, dotIndex);
  }
  if (! port) {
    res.statusCode = 404;
    res.statusMessage = 'Not Found';
    return res.end();
  }
  proxy.ws(req, socket, head, { target: 'http://'+dindHost+':'+port });
});

proxyServer.listen(3000);
