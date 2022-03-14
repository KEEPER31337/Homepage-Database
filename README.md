

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.28.0
- 20220314 DB 패치노트
- 컬럼이 추가 및 변경되었습니다.
    - `study`
        - `thumbnail_id`
            - `DEFAULT 1` 이 추가되었습니다. `thumbnail_id = 1`은 default 섬네일을 가르킵니다.
        - `head_member_id`
            - 스터디 장을 의미하는 컬럼입니다.
            - `member` table의 fk입니다.
- 테이블 기본 값이 추가되었습니다.
    - `thumbnail`
        - 직사각형, 정사각형 default 섬네일이 각각 `id`가 1,2로 insert 됩니다.
    - `file`
        - default 섬네일의 원본 파일 역할을 하는 행이 추가되었습니다.
        - 실제 경로는 섬네일과 똑같습니다.