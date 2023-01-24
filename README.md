# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note

### keeper_db 1.20.0-renew1.0

- 20230124 DB 업데이트
- 새해 첫 업데이트네요! 다들 새해 복 많이 받으세요~🎆
- `register_date` 컬럼 명을 `register_time으로` 통일시켰습니다.
  - `member` `book` `equipment` `friend`
- 추후 유지보수를 위하여, 주요 테이블에 row 생성, 수정시간을 저장하는 컬럼을 추가했습니다.
  - `update_time`만 추가된 테이블
    - `member` `book` `equipment` `study` `ctf_contest` `ctf_team` `ctf_challenge`
  - `register_time` `update_time` 둘 다 추가된 테이블
    - `survey` `seminar`
  - `update_time`이 추가된 모든 테이블들은 UPDATE 쿼리가 실행되었을때 자동으로 현재시각으로 업데이트 되도록 TRIGGER를 세팅했습니다.
