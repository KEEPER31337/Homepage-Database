

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.20.0
- 20220219 DB패치노트
- 컬럼의 속성이 변경되었습니다.
    - `comment.content` : `tinytext`에서 `text`로 변경되었습니다.
        - 이관 댓글 중 길이가 초과하는게 있더라고요...
    - `member.student_id`  : `NOT NULL` 해제
        - 역시나 이관 학번 중 존재하지 않는 row가 있었습니다. `UNIQUE` 속성은 계속 유지됩니다.
- `category` : 삭제된 게시판의 게시물의 처리를 위해 virtual_category가 기본 값으로 `INSERT` 되었습니다.
    - `category.id`는 1입니다.
- `posting` : 현재는 `file.posting_id`가 `NULL`이 가능하여 괜찮지만, 만약을 위해 virtual_posting도 추가되었습니다.
- 현재 탈퇴회원의 게시물의 `posting.member_id`는 다 1(virtual_member)로 이관되도록 작성했습니다.
- 저번 패치에서 update.sql에 빼먹은 `category` 기본 값을 INSERT했습니다. 오류 있으면 제보 부탁드립니다!