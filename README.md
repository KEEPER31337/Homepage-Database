

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.16.0
- 20220212 DB패치노트
- `member`
    - `generation` 컬럼의 type이 변경되었습니다. `int` -> `float`
    - .5 가 붙는 기수를 나타내기 위해 변경되었습니다. 
- `category` 
    - `href` 컬럼이 추가되었습니다. `varchar(45)` `NULL` 허용