const cp = require('child_process');
const fs = require('fs');
const path = require('path');

const mac = process.platform === 'darwin';

const dir = path.join.apply(path, [
  process.env.HOME
].concat(mac ? [
  'Library',
  'Application Support',
  'Sublime Text 3'
] : [
  '.config',
  'sublime-text-3'
]).concat([
  'Packages',
  'User'
]));

const prefs = path.join(dir, 'Preferences.sublime-settings');
const pkgctrl = path.join(dir, 'Package Control.sublime-settings');

const here = filename => path.join(__dirname, filename);

const readJSON = filename => {
  try {
    return JSON.parse(fs.readFileSync(filename, 'utf8'));
  } catch (x) {
    return null;
  }
};

const writeJSON = (filename, data) => {
  fs.writeFileSync(filename, JSON.stringify(alphabetize(data), null, '  '));
};

const alphabetize = obj => {
  var result = {};
  Object.keys(obj).sort().forEach(key => result[key] = obj[key]);
  return result;
};

// Make sure the preferences directory exists before continuing.
cp.spawn('mkdir', ['-p', dir]).on('close', code => {

  const current = readJSON(prefs);
  const common = readJSON(here('common.json'));
  const platform = readJSON(here(`${mac ? 'mac' : 'linux'}.json`));

  // The common/platform preferences override the current prefs because any
  // customizations to the preferences defined here should be moved to this
  // repo rather than living on an individual machine.
  const combined = Object.assign({}, current, common, platform);

  writeJSON(prefs, combined);
  console.log(`Wrote Sublime preferences to ${prefs}`);

  // Package Control preferences are not merged or anything. Blindly updated.
  // Settings should be identical across platforms.
  writeJSON(pkgctrl, readJSON(here('packages.json')));
  console.log(`Wrote Package Control preferences to ${pkgctrl}`);
  console.log('Restart Sublime Text 3 if it is running!');
});
