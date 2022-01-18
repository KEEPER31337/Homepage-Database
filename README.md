

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.5.0
- original_image 테이블을 만들었습니다. 섬네일로 표현되는 모든 이미지들의 원본 사진 테이블입니다.
    - 그에 따라 thumbnail 테이블에 original_image_id 컬럼을 추가해 1:1 fk로 연결 했습니다.
    - 사용자가 이미지를 업로드하면 섬네일화 시키고, 원본사진은 original_image에, 섬네일은 thumbnail에 업로드하고, original_image_id를 추가하는 방식으로
- posting, member(프로필사진 용도), book, equipment에 thumbnail_id로 1:1 fk를 추가했습니다
    - 그에 따라, book, equipment의 picture(varchar(512))가 삭제되었습니다. @woduf0628 
- 추천/비추천 중복방지를 위한 테이블이 추가되었습니다. @codnjs8221 
    - 아래와 같이, posting, comment와 member를 n:m으로 연결하는 별도의 테이블들을 만들었습니다.
    - member_has_posting_like
    - member_has_posting_dislike
    - member_has_comment_like
    - member_has_comment_dislike
- ~짬통~고정글 테이블이 추가되었습니다. 타입은 별도의 테이블로 1:1 연결했습니다. (구조 변경 가능성 농후)
    - static_write
    - static_write_type