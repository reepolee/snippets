import fg from 'fast-glob';
import pkg from 'fs-extra';
import sharp from 'sharp';
const { mkdirp, removeSync } = pkg;
// const resized_widths = [300, 500, 800, 1440];
const resized_widths = [500];

const inFolder = './content';
const outFolder = './responsive';
console.log('Preparing responsive images');
removeSync(outFolder);

const jpg = getFiles(inFolder, 'jpg');
if (jpg.length > 0) {
	jpg.forEach((el) => {
		const img = sharp(el.fullpath);
		recodeImage(img, el);
		resized_widths.forEach((w) => resizeImage(img, w, el));
	});
}

const png = getFiles(inFolder, 'png');
if (png.length > 0) {
	png.forEach((el) => {
		const img = sharp(el.fullpath);
		recodeImage(img, el);
		resized_widths.forEach((w) => resizeImage(img, w, el));
	});
}

function resizeImage(img, width, inFile) {
	const f = `${outFolder}/${width}`;
	mkdirp(f, { recursive: true });

	const outputFolder = inFile.filepath.replace(inFolder, f);
	mkdirp(outputFolder);

	const outputFile = inFile.fullpath.replace(inFolder, f);
	const outputFileAvif = outputFile.replace(inFile.ext, 'avif');
	const outputFileWebP = outputFile.replace(inFile.ext, 'webp');
	img.resize(width, width, {
		fit: sharp.fit.inside,
		//  withoutEnlargement: true,
	});

	// for dev purposes, you might want to integrate image width into actual image
	// to quickly see which one gets used by the browser
	//
	// const _svg = `<svg height="${width / 2}" width="${width / 2}"><text x="10" y="${width / 2 - 30}" font-size="${width / 5}" fill="#4400ff">${width}</text> </svg>`;
	// const svg = new Buffer.from(_svg);
	// img.composite([{ input: svg, gravity: 'southwest' }]).toBuffer();
	// end width size

	img.clone().toFormat('jpeg').jpeg({ quality: 65 }).toFile(outputFile);
	img.clone().toFormat('avif').avif({ quality: 55 }).toFile(outputFileAvif);
	img.clone().toFormat('webp').webp({ quality: 65 }).toFile(outputFileWebP);
}

function recodeImage(img, inFile) {
	const f = outFolder;
	mkdirp(f);

	const outputFolder = inFile.filepath.replace(inFolder, f);
	mkdirp(outputFolder);

	const outputFile = inFile.fullpath.replace(inFolder, f);
	const outputFileAvif = outputFile.replace(inFile.ext, 'avif');
	const outputFileWebP = outputFile.replace(inFile.ext, 'webp');

	img.clone().toFormat('jpeg').jpeg({ quality: 65 }).toFile(outputFile);
	img.clone().toFormat('avif').avif({ quality: 55 }).toFile(outputFileAvif);
	img.clone().toFormat('webp').webp({ quality: 65 }).toFile(outputFileWebP);
}

function getFiles(inFolder, extension) {
	const entries = fg.sync(`${inFolder}/**/*.${extension}`, { dot: true });
	const filesObject = entries.map((file) => {
		const regexp = /^(.*[\\\/])(.*)$/;
		const match = regexp.exec(file);
		const nameExt = match[2].split('.');
		return {
			fullpath: file,
			filepath: match[1],
			filename: match[2],
			name: nameExt[0],
			ext: nameExt[1],
			dirname: regexp.exec(match[1].substring(0, match[1].length - 1))[2],
		};
	});
	return filesObject;
}
