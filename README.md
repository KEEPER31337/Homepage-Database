

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.24.0
- 20220226 DB 패치노트
- 기본값 추가
    - `static_write_title` `static_write_subtitle_image` `static_write_content`
        - 현 테스트 서버에서 추가된 동아리 소개 글 등을 기본 값으로 추가 시켰습니다.
        - 이미 현 테스트 서버 DB내에 추가되어 있으므로 `update.sql`엔 해당내용이 없습니다.
    - `category`
        - 누락된 게시판 "익명게시판"(id:63908)이 추가 되었습니다.