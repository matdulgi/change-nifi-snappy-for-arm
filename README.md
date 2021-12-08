# changeSnappyJava
라즈베리파이, mac 환경 등 arm 아키텍쳐의 Nifi 사용을 위해 제작했습니다
changeSnappyJava.sh 스크립트 파일을 통해 모든 snappy-java 파일을 교체합니다
nifi 기본 경로는 /usr/local/nifi이며, 설치 경로가 다를 경우 해당 경로 부분을 수정해야 합니다

작업은 기존 파일 백업, 기존 파일 삭제, 디렉토리 내의 새 파일로 교체 순으로 진행됩니다
