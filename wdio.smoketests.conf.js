const { hooks } = require("./support/hooks");

exports.config = {
  runner: "local",
  specs: ["./features/**/*.feature"],
  exclude: [],
  maxInstances: 1,
  capabilities: [
    {
      maxInstances: 1,
      acceptInsecureCerts: true,
      browserName: "chrome",
      "goog:chromeOptions": {
        args: [
          "--disable-infobars",
          "--window-size=1444,774",
          "--headless",
          "--no-sandbox",
          "--disable-gpu",
          "--disable-setuid-sandbox",
          "--disable-dev-shm-usage",
        ],
      },
    },
  ],

  hostname: "selenium",
  port: 4444,
  path: "/wd/hub",

  // Level of logging verbosity: trace | debug | info | warn | error | silent
  logLevel: "debug",

  // If you only want to run your tests until a specific amount of tests have failed use
  // bail (default is 0 - don't bail, run all tests).
  bail: 0,
  baseUrl: "http://localhost:3000",
  //
  // Default timeout for all waitFor* commands.
  waitforTimeout: 10000,
  //
  // Default timeout in milliseconds for request
  // if browser driver or grid doesn't send response
  connectionRetryTimeout: 120000,
  //
  // Default request retries count
  connectionRetryCount: 3,

  framework: "cucumber",
  reporters: [
    "spec",
    [
      "cucumberjs-json",
      {
        jsonFolder: "./reports/json/",
        language: "en",
      },
    ],
  ],
  cucumberOpts: {
    require: ["./features/steps/*steps.js"],
    backtrace: false,
    requireModule: [],
    dryRun: false,
    failFast: false,
    format: ["pretty"],
    snippets: false,
    source: true,
    profile: [],
    strict: false,
    tagExpression: "not @wip",
    timeout: 60000,
    ignoreUndefinedDefinitions: true,
  },
  ...hooks,
};
