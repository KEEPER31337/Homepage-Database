

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.4.0
- 20220512 DB 패치노트
- 컬럼이 추가되었습니다.
    - `ctf_challenge`
        - `file_id` : `INT` `NULL` `file` 테이블과 fk 관계입니다. CTF 문제 중 파일첨부가 필요한 문제에 쓰입니다.
- 기본 값이 추가되었습니다.
    - `member_job`
        - `"ROLE_출제자"` : `id`는 10입니다.