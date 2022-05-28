

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.6.0
- 20220528 DB 패치노트
- 테이블이 수정되었습니다.
    - `ctf_team` : `UNIQUE KEY` 추가
        - `name`과 `contest_id`를 `UNIQUE KEY` 쌍으로 추가했습니다.
        - 이제 하나의 CTF 대회에는 중복된 이름의 팀이 존재할 수 없습니다.
    - `ctf_submit_log` : 컬럼 삭제 및 추가
        - `team_id`, `submitter`, `challenge_id` 컬럼이 삭제되었습니다.
        - 이에, 관련 `KEY`와 `CONSTRAINT`도 삭제되었습니다.
        - 팀이나 회원이 삭제되더라도 로그에 정보를 남기기 위함입니다.
        - 대신, 팀명, 회원 로그인 id, 회원 실명, 문제 명, 대회 명을 저장하는 새 컬럼들이 추가되었습니다.
            - `team_name`, `submitter_login_id`,`submitter_realname`, `challenge_name`, `contest_name`
