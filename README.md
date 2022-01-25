

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.8.0
- 20220125 DB패치노트
    - `original_image` 테이블 삭제
        - 무수한 반대의견으로 인해 `original_image` 테이블이 삭제 되었습니다.
        - 이제 `thumbnail`은 원본파일로 file 테이블을 가리킵니다. `file_id`
        - 이에, `file`  테이블의 posting_id 컬럼에 `NOT NULL`. 속성이 비활성화 되었습니다.
    - 출석부 관련 테이블 생성
        - `attendance`
            - 어떤 멤버가, 언제 출석해서, 포인트를 얼마나 얻었는지를 기록합니다.
            - 대조표 최하단을 참조해주세요.
        - `non_absence`
            - 개근 관련 정적 데이터를 저장합니다.
            - `term`으로는 YEAR / MONTH / WEEK등의 데이터가 들어갈 예정입니다.
            - `point` 는 일단 현재 기준을 따르도록 하였습니다.
            - 대조표 최하단을 참조해주세요.