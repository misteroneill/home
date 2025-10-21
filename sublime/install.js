const cp = require('child_process');
const fs = require('fs');
const path = require('path');

const dir = path.resolve(process.env.HOME, 'Library', 'Application Support', 'Sublime Text', 'Packages', 'User');
const prefs = path.resolve(dir, 'Preferences.sublime-settings');
const pkgctrl = path.resolve(dir, 'Package Control.sublime-settings');

const here = filename => path.resolve(__dirname, filename);

const readJSON = filename => {
  try {
    return JSON.parse(fs.readFileSync(filename, 'utf8'));
  } catch (x) {
    console.error(`failed to parse ${filename}`);
    return null;
  }
};

// Alphabetize an object by its keys. Only works because of how V8 manages objects!
const alphabetize = (obj) => {
  var result = {};
  Object.keys(obj).sort().forEach(key => result[key] = obj[key]);
  return result;
};

const writeJSON = (filename, data) => {
  fs.writeFileSync(filename, JSON.stringify(alphabetize(data), null, '  '));
};

cp.spawn('mkdir', ['-p', dir]).on('close', code => {
  const current = readJSON(prefs);
  const preferences = readJSON(here('preferences.json'));
  const merged = Object.assign({}, current, preferences);

  writeJSON(prefs, merged);
  console.log(`Wrote Sublime preferences to ${prefs}`);

  // Package Control preferences are not merged or anything. Blindly updated.
  const packages = readJSON(here('packages.json'));

  writeJSON(pkgctrl, packages);
  console.log(`Wrote Package Control preferences to ${pkgctrl}`);
  console.log('Restart Sublime Text if it is running!');
});
