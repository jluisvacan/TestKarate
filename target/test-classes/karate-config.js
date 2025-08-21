function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    username: 'admin1',
    password: 'welcome',
    _url: 'http://localhost:9897'
}
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.username = 'author';
    config.password = 'authorpassword';
  } else if (env == 'e2e') {
    // customize
    config.username = 'user';
    config.password = 'userpassword';
  } else if (env == 'staging') {
    // initialize the config for the staging
    config.username = 'stagingauthor';
    config.password = 'stagingauthorpassword';
    config._url: 'http://staginglocalhost:9897';
  } else if (env == 'preprod') {
    // initialize the config for preprod
    config.username = 'preprodauthor';
    config.password = 'preprodauthorpassword';
    config._url: 'http://preprodlocalhost:9897';
  } else if (env == 'prod') {
   // initialize the config for prod
    config.username = 'prodauthor';
    config.password = 'prodauthorpassword';
    config._url: 'http://localhost:9897';
    }
  return config;
}