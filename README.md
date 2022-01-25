

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.8.1
- 20220125 핫픽스 - 1
    - `static_write_subtitle_image` 와 `static_write_content` 테이블에 순서 컬럼이 추가되었습니다.
        - `display_order`
            - `order` 는 MySQL 예약어입니다.
            - 타입은 `int` , default는 0입니다.