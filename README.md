# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note

### keeper_db 1.20.0-renew8.0

20230630 DB 업데이트

- `file`, `posting`, `ctf_challenge`의 관계를 개편 했습니다.
- `posting` - `file` : 1:N -> N:M
- `ctf_challenge` - `file` : 1:1 -> N:M
- 이제 ctf 문제는 여러개의 첨부파일을 가질 수 있습니다.

- 이에 컬럼/관계가 제거 되었습니다.
  - `file.posting_id` 제거
	- 대신 `posting_has_file` 테이블이 추가되었습니다.
		- 컬럼으로 `posting_id`, `file_id`를 가지게 됩니다.
  - `ctf_challnge.file_id` 제거
	- `ctf_challenge_has_file` 테이블이 추가되었습니다.
		- 컬럼으로 `ctf_challenge_id`, `file_id`를 가지게 됩니다.

