function fn() {
  // Provide the value of this property via JVM argument (-Dkarate.env=<value>)
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  let config = {
    env: env,
    myVarName: 'someValue',
    username: "admin1",
    password: "welcome",
    _url: "http://localhost:9191 "
  }
  if (env === 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.username = "author"
    config.password = "authorpassword"
  } else if (env === 'e2e') {
    // customize
    config.username = "user"
    config.password = "userpassword"
  } else if (env === 'staging') {
    // customize
    config.username = "stagingadmin1"
    config.password = "stagingwelcome"
    config._url = "http://staging.localhost:9191"
  } else if (env === 'preprod') {
    // customize
    config.username = "preprodadmin1"
    config.password = "preprodwelcome"
    config._url = "http://preprod.localhost:9191"
  } else if (env === 'prod') {
    // customize
    config.username = "prodadmin1"
    config.password = "prodwelcome"
    config._url = "http://prod.localhost:9191"
  }
  return config;
}