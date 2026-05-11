#!/bin/bash

# --- One-click Setup script for new Digital Textbook ---
echo "============================================="
echo "  📚 디지털 교과서 원클릭팩 생성 스크립트  "
echo "============================================="
echo ""
read -p "새로운 프로젝트 폴더 이름을 입력하세요 (예: math_m3): " NEW_BOOK

if [ -z "$NEW_BOOK" ]; then
    echo "❌ 폴더 이름이 비어있습니다. 종료합니다."
    exit 1
fi

PARENT_DIR=$(dirname "$(pwd)")
TARGET_DIR="$PARENT_DIR/$NEW_BOOK"

if [ -d "$TARGET_DIR" ]; then
    echo "❌ 이미 존재하는 폴더입니다: $TARGET_DIR"
    exit 1
fi

echo "🚀 새로운 프로젝트 폴더를 생성합니다: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# 복사 대상: Start_copy의 모든 파일 및 디렉토리
echo "📦 템플릿 파일을 복사합니다..."
cp -R . "$TARGET_DIR"

# 사용된 이 스크립트 파일은 새 프로젝트에서 삭제
rm -f "$TARGET_DIR/setup_new_book.sh"

echo "⚙️ 새 프로젝트 설정을 완료했습니다!"
echo "✨ 아래 명령어로 작업을 시작하세요:"
echo ""
echo "cd $TARGET_DIR/web"
echo "npm install"
echo "npm run dev"
echo ""
echo "============================================="
