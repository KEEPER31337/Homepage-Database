

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.6.0
- member table에 상/벌점이 추가되었습니다.
    - merit(int) / demerit(int)
- posting table에 임시저장 여부가 추가되었습니다.
    - is_temp(tinyint)
- 모든 table의 thumbnail_id에서 NULL이 허용되었습니다.
- static_write 테이블이 아래의 3개 테이블로 분리되었습니다. 위에서 아래로 1:n관계입니다.
    - static_write_title
    - static_write_subtitle_image
    - static_write_content
- member_entity_roles 테이블이 추가 되었습니다. @koty08 
- 기본값을 자동으로 insert해주도록 설정했습니다.