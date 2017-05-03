var http = require('http');
var httpProxy = require('http-proxy');

var proxy = httpProxy.createProxyServer({});

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
  proxy.web(req, res, { target: 'http://127.0.0.1:'+port });
});

proxyServer.on('upgrade', function (req, socket, head) {
  proxy.ws(req, socket, head);
});

proxyServer.listen(3000);
