

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.15.0
- 20220211 DB패치노트
- `point_log`
    - 적립과 사용여부를 구분하는 `is_spent` 컬럼이 추가되었습니다. 타입은 `tinyint`(`boolean`)이며, `NOT NULL`, `DEFAULT 1` 입니다. @youareso98 
- `member`
    - 기수를 구분하는 `generation` 컬럼이 추가되었습니다. `int`이며 `NULL`사용이 가능합니다. @gusah009 