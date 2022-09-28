

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.16.0
- 20220928 DB 업데이트
- `member` 테이블에 총 출석일을 저장하는 컬럼이 추가되었습니다.
    - `total_attendance` `INT` `NOT NULL` `DEFAULT 0`
- `attendance` 테이블에 트리거가 추가되었습니다.
    - `attendance_AFTER_INSERT`
        - `UPDATE member SET total_attendance = total_attendance + 1 WHERE id = NEW.member_id;` 
        - attendance에 데이터가 추가되면 해당 member_id에 맞는 member의 `total_attendance` 를 1씩 늘려주는 트리거입니다.
        - 해당 트리거가 존재하므로, 백엔드 측에서 `total_attendance` 를 수정할 필요가 없을 것 같습니다!