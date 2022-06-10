

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.8.0
- 20220610 DB 패치노트
- 컬럼이 추가되었습니다.
    - `ctf_submit_log`
        - `ctf_contest_id` : `ctf_contest`와 fk 관계입니다. 앞선 패치에서 log에선 fk를 배제하겠다고 하였으나, 관리자가 contest별로 로그를 조회할 필요성이 존재하여 추가하게 되었습니다. 대신, 후술할 트리거를 추가하여 삭제될 경우를 대비하였습니다.
- 트리거가 추가되었습니다.
    - `ctf_contest`
        - `BEFORE DELETE` 
            - 본 테이블의 row가 삭제될 경우, 해당 id를 참조하는 `ctf_submit_log` 의 `ctf_contest_id` 를 `DEFAULT`값(1)으로 UPDATE합니다. log 테이블은 기록을 남겨야 할 필요가 있기에 `FOREIGN KEY ON DELETE CASCADE` 를 설정하지 않고 트리거로 대체했습니다.