# Princess Playlist - 메이크업 게임 프로젝트

## 프로젝트 개요
ETUDE 아모레 공모전을 위한 HTML5 기반 인터랙티브 메이크업 게임입니다.

## 주요 기능

### 1. 인트로 영상
- 게임 시작 시 `intro_video.mp4` 자동 재생
- 건너뛰기 버튼 제공
- 영상 종료 후 자동으로 홈 화면 전환

### 2. 퍼스널 컬러 시스템
- **WARM (디어)**: 따뜻한 톤의 메이크업
- **COOL (픽시)**: 차가운 톤의 메이크업
- 캐릭터별 전용 이미지 및 메이크업 레이어

### 3. 메이크업 시스템
- **페이스**: 파운데이션/베이스
- **아이**: 섀도우, 아이라이너, 마스카라
- **립**: 틴트, 립스틱, 글로스, 립밤
- **치크**: 블러셔
- **헤어**: 헤어 스타일링

#### 입술 메이크업 (개선됨)
- 기존: 타원형 오버레이 방식
- **현재**: 실제 입술 형태 마스크 레이어 사용
  - `warm_lip_layer.png` - WARM 캐릭터 입술 마스크
  - `cool_lip_layer.png` - COOL 캐릭터 입술 마스크
- 색상 블렌딩으로 자연스러운 립 메이크업 구현

### 4. 갤러리 시스템
- 완성된 메이크업 저장
- LocalStorage 사용
- 초대장 팝업 표시

### 5. AI 스타일링
- 원클릭으로 추천 메이크업 적용

---

## 자동 배포 시스템

### 배포 방법

#### Windows
```bash
# 터미널에서 실행
deploy.bat
```

#### Git Bash / Mac / Linux
```bash
# 실행 권한 부여 (최초 1회)
chmod +x deploy.sh

# 배포 실행
./deploy.sh
```

### 배포 프로세스
1. **변경사항 확인**: `git status`
2. **파일 추가**: `git add .`
3. **커밋**: 커밋 메시지 입력 (기본값: "Update game files")
4. **Push**: `git push origin master`
5. **Cloudflare Pages 자동 배포**: GitHub push 감지 시 자동 빌드 및 배포

### Cloudflare Pages 설정 확인
- Repository: `Breaduck/Makeup-Game`
- Branch: `master`
- Build directory: `/` (루트)
- Framework preset: None (정적 사이트)

---

## 파일 구조

```
paik/
├── index.html              # 메인 HTML
├── app.js                  # 게임 로직
├── style.css               # 스타일
├── deploy.bat              # Windows 배포 스크립트
├── deploy.sh               # Mac/Linux 배포 스크립트
├── claude.md               # 이 문서
│
├── intro_video.mp4         # 인트로 영상
│
├── warm_char.png           # WARM 캐릭터
├── cool_char.png           # COOL 캐릭터
├── warm_lip_layer.png      # WARM 입술 마스크
├── cool_lip_layer.png      # COOL 입술 마스크
│
├── logo_circle.png
├── invitation.png
│
├── palette_eye*.png        # 아이섀도우 팔레트
├── eyeliner*.png           # 아이라이너
├── mascara*.png            # 마스카라
├── lipbalm*.png            # 립밤
│
└── [기타 에셋...]
```

---

## 개발 가이드

### 새로운 메이크업 아이템 추가

#### 1. 이미지 준비
- 파일명: `product_name.png`
- 투명 배경 PNG 권장

#### 2. app.js 수정
```javascript
// renderProducts() 함수에서 제품 추가
products = [
    { id: 1, image: 'new_product.png', color: '#COLOR' },
    // ...
];
```

### 새로운 마스크 레이어 추가

#### 방법 1: Python으로 자동 추출 (권장)
```python
# extract_lips.py 참고
# 색상 범위 조정하여 원하는 영역 추출
```

#### 방법 2: 이미지 편집 도구 사용
- Photoshop, GIMP, Figma 등 사용
- 원본 캐릭터에서 해당 부위만 추출
- 투명 배경 PNG로 저장

#### 3. app.js에 마스크 등록
```javascript
// 마스크 이미지 로드
const lipMasks = {
    warm: new Image(),
    cool: new Image()
};
lipMasks.warm.src = 'warm_lip_layer.png';
lipMasks.cool.src = 'cool_lip_layer.png';
```

---

## 기술 스택

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Canvas**: 메이크업 렌더링
- **Storage**: LocalStorage (갤러리)
- **이미지 처리**: Python PIL/Pillow (개발용)
- **배포**: GitHub + Cloudflare Pages
- **버전 관리**: Git

---

## 알려진 이슈

### 해결됨
- ✅ 입술 메이크업이 좌표 기반 타원형으로만 적용되던 문제 → 마스크 레이어 방식으로 개선

### 개선 예정
- [ ] 눈(아이섀도우) 마스크 레이어 추가
- [ ] 볼(치크) 마스크 레이어 추가
- [ ] 헤어 스타일 변경 기능
- [ ] 더 많은 제품 추가

---

## Claude Code 사용 가이드

### ⚠️ 중요: 항상 질문하기
모르는 것이 있거나 요구사항이 불명확하면 **반드시 먼저 질문**하세요.

#### 질문해야 하는 경우:
- 기능 요구사항이 명확하지 않을 때
- 여러 구현 방법이 있을 때
- 기존 코드의 의도를 확실히 모를 때
- 사용자가 원하는 디자인/UX가 불분명할 때
- 외부 리소스(이미지, 영상 등)가 필요할 때

#### 예시:
- ❌ "입술 메이크업을 개선했습니다" (사용자가 원하는 방식 확인 없이)
- ✅ "입술 메이크업을 개선하려면 마스크 이미지가 필요합니다. 직접 제작하시겠습니까, 아니면 제가 Python으로 추출해드릴까요?"

### 작업 흐름
1. **요구사항 확인** → 불명확하면 질문
2. **기존 코드 분석** → 코드 의도 파악
3. **구현 방법 제안** → 여러 옵션 제시
4. **승인 후 구현** → 확인 받은 방법으로 진행
5. **테스트 및 문서화** → 변경사항 기록

---

## 문의 및 지원

프로젝트 관련 질문이나 기능 개선 제안이 있으면:
1. GitHub Issues 등록
2. 이 문서 업데이트
3. Claude Code와 대화하며 개발 진행

---

**마지막 업데이트**: 2026-04-20
**버전**: 1.1.0 (입술 마스크 레이어 추가)
