# Contributing Guildline

* [專案管理](#專案管理)
* [開發流程](#開發流程)
* [語言](#語言)
* [參考資料](#參考資料)

## 專案管理
1. 每個項目如開發週期較長，盡量開成 github issue 以方便追蹤
   1. 將 Assignees 填上自己
   1. 指定 label
      * 分類：`feature`, `bugfix`, `hotfix`, `doc`

## 開發流程
1. 從主幹分支
   * feature/bugfix: 主幹為 `dev`
   * branch name: `{type}-{number}-{description}`
      * `type`: feature, bugfix, hotfix, doc
      * `number`: github issue number (If have a corresponding issue)
      * `description`: 關鍵字
      * example: `feature-123-new-level-levelname`
2. 把branch push 到**自己**的 repo (例如 `HappyFeet07/cypherpunks-ctf`)
3. coding... (只要有 commit 就 push，以免 local 電腦損壞)
4. 建 Pull request (github 上只要有一個 commit 就可以建 PR)
   * PR name: 一句話敘述要做什麼事，這句話會是將來 merge 時的 log ([How to Write a Git Commit Message)
](https://chris.beams.io/posts/git-commit/)
   * PR body: 填相關聯的 issue number，或可用 check list 來安排進度
   * Assignees: 至少要填自己
5. 完成該 issue 後，選擇 Reviewers
6. 根據 review 結果修改，直到 reviewers approved
7. Merge: 若沒有 conflict 可直接在網站上操作 merge
   * log: 預設是原本的 PR name，記得加上相關聯的 issue number
      * example1: `Implement the change-password feature (#123)` (參照 issue 123)
      * example2: `Implement the change-password feature (close #123)` (關閉 issue 123)

## 語言
* Coding style: 
   * 縮排為兩個空格
   * [Solidity](https://solidity.readthedocs.io/en/v0.4.24/style-guide.html)
   * Pull request 前執行`npm run lint`，並通過其檢驗

## 參考資料
1. [How to write a git commit message](https://chris.beams.io/posts/git-commit/)
   * 大原則：
      * 大寫動詞開頭
      * 結尾不加句點
      * 註明相關 issue
   * 範例：`Refactor the OOO part with XXX methods (close #123)`
1. How to do code review [part one](https://mtlynch.io/human-code-reviews-1), [part two](https://mtlynch.io/human-code-reviews-1)
1. [Semantic versioning](https://semver.org/)
    * 大原則：X.Y.Z
      * X: 不向下相容 (2.0 不相容 1.0)
      * Y: 向下相容 (2.1 相容 2.0，只能加新功能，不能移除原有功能或改變原有功能行為)
      * Z: bug fix (不加新功能也不能移除原有功能或改變原有功能行為，僅修 bug)
