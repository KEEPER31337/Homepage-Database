

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.10.0
- 20220817 DB 업데이트
- 새 테이블들이 추가되었습니다.
- `survey` 
    - 활동인원조사를 기록하는 테이블입니다.
    - 시작시간, 마감시간등을 저장합니다.
    - 공개 / 비공개를 지정할 수 있습니다.
    - `id` 1번에 dummy data가 있으므로, 예외처리 해주시면 감사하겠습니다.
    - `name` 을 NULL로 주시면 자동으로 "%Y%m%d_활동인원조사"로 저장하게 되어있습니다.
- `survey_reply`
    - 인원조사 응답의 종류를 기록합니다.
    - 활동/휴면(군휴학)/휴면(기타)/졸업/탈퇴
- `survey_member_reply`
    - 조사 / 사용자 별 응답을 기록하는 테이블입니다.
        - fk로 지정된 `member_id`와 `survey_id`가 UNIQUE 쌍으로 지정되어 있습니다.
        - 즉, 한 명의 사용자는 하나의 조사에 대해 한번만 참여할 수 있습니다.
    - `ON DELETE CASCADE` 가 지정되어 있으므로, 연결된 `member`나 `survey`가 삭제되면, 같이 삭제됩니다.
- `survey_reply_excuse`
    - 휴면(기타)를 선택한 사용자의 사유를 기록하는 테이블입니다.
    - `ON DELETE CASCADE` 가 지정되어 있으므로, 연결된 `survey_member_reply`가 삭제되면, 같이 삭제됩니다.
- `seminar`
    - 세미나 단위를 저장하는 테이블입니다.
    - 출석 시작시간, 출석 마감시간, 지각 마감시간, 출석코드 등을 저장합니다.
    - `id` 1번에 dummy data가 있으므로, 예외처리 해주시면 감사하겠습니다.
    - `name` 을 NULL로 주시면 자동으로 "%Y%m%d_세미나"로 저장하게 되어있습니다.
- `seminar_attendance_status`
    - 출결종류를 저장하는 테이블입니다.
    - 출석/지각/결석/개인사정
- `seminar_attendance`
    - 사용자, 세미나별 출석 현황을 기록하는 테이블 입니다.
        - fk로 지정된 `member_id`와 `seminar_id`가 UNIQUE 쌍으로 지정되어 있습니다.
    - `ON DELETE CASCADE` 가 지정되어 있으므로, 연결된 `member`나 `seminar`가 삭제되면, 같이 삭제됩니다.
- `seminar_absense_excuse`
    - 개인사유로 인해 결석한 사용자의 사유를 기록하는 테이블입니다.
    - `ON DELETE CASCADE` 가 지정되어 있으므로, 연결된 `seminar_attendance`가 삭제되면, 같이 삭제됩니다.
