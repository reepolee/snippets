import { readFileSync } from 'fs';
import { join } from 'path';
import { sync } from 'glob';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

// Load the sl.json file
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const slJsonPath = join(__dirname, 'src', 'i18n', 'sl.json');
const slJson = JSON.parse(readFileSync(slJsonPath, 'utf8'));

// Extract all keys from sl.json
const extractKeys = (obj, prefix = '') => {
	return Object.keys(obj).reduce((res, key) => {
		const value = obj[key];
		const prefixedKey = prefix ? `${prefix}.${key}` : key;
		if (typeof value === 'object' && value !== null) {
			res.push(...extractKeys(value, prefixedKey));
		} else {
			res.push(prefixedKey);
		}
		return res;
	}, []);
};

const slKeys = extractKeys(slJson);

// Search for _() usage in src directory
import { statSync } from 'fs';

const srcDir = join(__dirname, 'src');
const files = sync(`${srcDir}/**/*`).filter((file) => statSync(file).isFile());

const usedKeys = new Set();

files.forEach((file) => {
	const content = readFileSync(file, 'utf8');
	const regex = /_\(['"`]([^'"`]+)['"`]\)/g;
	let match;
	while ((match = regex.exec(content)) !== null) {
		usedKeys.add(match[1]);
	}
});

// Identify unused keys
const unusedKeys = slKeys.filter((key) => !usedKeys.has(key));

console.log('Unused keys in sl.json:', unusedKeys);
