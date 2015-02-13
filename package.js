Package.describe({
  name: "robertlowe:autoform-pickadate",
  version: "0.1.0",
  summary: "pickadate.js for autoform",
  git: "https://github.com/robertlowe/autoform-pickadate"
});

Package.onUse(function (api, where) {
  api.versionsFrom('1.0.3.1');

  api.use('templating');
  api.use('underscore');
  api.use('jquery');
  api.use('tracker');
  api.use('coffeescript');
  api.use('mquandalle:jade');
  api.use('aldeed:autoform');
  api.use('robertlowe:pickadate@3.5.5');

  api.addFiles('autoform-pickadate.jade', 'client');
  api.addFiles('autoform-pickadate.coffee', 'client');
});

Package.onTest(function (api) {
});