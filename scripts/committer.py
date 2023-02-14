from git import Repo

REPO_DIR:str = "/home/ghimmk/keeper_homepage/Homepage-Database"

repo: Repo = Repo(REPO_DIR)

commit_content = """
- 20230205 DB 업데이트
- 어색한 컬럼 명, 타입 제보는 언제든 환영입니다🙌
  - `book`
    - `department` -> `book_department_id`
  - `study`
    - 다음 3개의 컬럼이 `NOT NULL` 로 변화했습니다.
    - `information` `head_member_id` `register_time`
"""

send_time_str: str = "2023-02-05 21:59:25"
send_date_str: str = send_time_str.split()[0]

repo.git.add(f"{REPO_DIR}/README.md")
repo.git.add(f"{REPO_DIR}/recent_init.sql")
repo.git.add(f"{REPO_DIR}/{send_date_str}")

repo.index.commit(commit_content,
    commit_date=send_time_str,
    author_date=send_time_str)
