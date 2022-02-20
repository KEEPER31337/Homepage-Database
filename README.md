

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.21.1
- 20220220 DB 핫픽스 1
- 새 컬럼이 추가되었습니다. `attendance`
    - `date` `INT` `NOT NULL` `DEFAULT (CURRENT_DATE)`
    - 출석 날짜를 저장하여 `UNIQUE KEY`로 활용하기 위한 컬럼입니다.
    - 이에 `UNIQUE KEY`가 추가되었습니다. `member_id`와 `date`에 동시에 중복불가 제약을 줍니다.