

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.30.0
- 20220317 DB 패치노트
- 새 컬럼이 추가되었습니다.
- `member_job` `member_type` `member_rank` 
    - `badge_thumbnail_id`
        - `INT` `NOT NULL`
        - 멤버의 직위, 상태, 등급의 뱃지 이미지를 가르키는 컬럼입니다.
        - `thumbnail` 테이블의 fk입니다.
        - 기본값은 공유 시트에 적어두겠습니다!
- 기본값이 변경되었습니다.
    - `file` `thumbnail`
        - 기존에 square, rectangle로 표현되던 파일명들이 member, posting등 용도로 변경되었습니다.
        - 뱃지관련 이미지들이 추가되었습니다.
        - 이것도 공유 시트에 적어 놓겠습니당~
    - `member`
        - `id`가 1인 `virtual_member`의 `thumbnail_id`가 탈퇴회원 뱃지 이미지 `id`(6)를 가르킵니다. 