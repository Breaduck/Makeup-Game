const fs = require('fs');
const path = require('path');

// 출력 디렉토리
const distDir = 'dist';

// 배포할 파일 목록 (paik 게임)
const filesToCopy = [
    'index.html',
    'app.js',
    'style.css',
    'characters.png',
    'cool_char.png',
    'warm_char.png',
    'eyeliner1.png',
    'eyeliner2.png',
    'invitation.png',
    'lipbalm1.png',
    'lipbalm2.png',
    'logo.png',
    'logo_circle.png',
    'mascara1.png',
    'mascara2.png',
    'mascara3.png',
    'mascara4.png',
    'mascara5.png',
    'mockup.png',
    'palette_eye1.png',
    'palette_eye2.png',
    'palette_eye3.png',
    'palette_eye4.png',
    'palette_eye5.png',
    'palettes.jpg'
];

// dist 디렉토리 생성
if (!fs.existsSync(distDir)) {
    fs.mkdirSync(distDir, { recursive: true });
}

console.log('🎨 Building Princess Playlist Game...');

// 파일 복사
filesToCopy.forEach(file => {
    const srcPath = path.join(__dirname, file);
    const destPath = path.join(__dirname, distDir, file);

    if (fs.existsSync(srcPath)) {
        fs.copyFileSync(srcPath, destPath);
        console.log(`✓ Copied ${file}`);
    } else {
        console.warn(`⚠ Warning: ${file} not found`);
    }
});

console.log('✅ Build complete! Output: ./dist');
