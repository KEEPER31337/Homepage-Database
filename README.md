

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.19.0
- 20220216 DB패치노트
- 컬럼이 추가되었습니다. `attendance` @koty08 
    - `rank_point` 출석순위에 따른 포인트
        - `NOT NULL` `DEFAULT 0` 
    - `continuous_point` 연속 출석일에 따른 포인트
        - `NOT NULL` `DEFAULT 0`
- 잘못된 컬럼 명을 수정하였습니다. @koty08 
    - `attendance.continous_day` -> `attendance.continuous_day`
    - continuous 스펠링이 상당히 헷갈리네요;; 혼선을 드려 죄송합니다... (_ _) 
- 테이블의 변경 점만을 업데이트하기 위한 `keeper_update.sql` 이 작성되었습니다. @rafch 
- `SQL_MODE`가 변경되었습니다.
    - `NO_ZERO_IN_DATE`, `NO_ZERO_DATE` 모드가 제거 되었습니다.
    - 함수 반환 값으로 `DEFAULT`가 지정될 경우 ALTER 명령어가 그 컬럼에 대해서 아예 먹지 않는 이슈가 있었습니다... 버그 같은데... 노션 참고해주세용