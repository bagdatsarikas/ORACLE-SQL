

### Oracle SQL Practice

Hands-on SQL exercises, from basic to advanced, built on the classic SCOTT schema.

Environment

All exercises are written for Oracle FreeSQL, a browser-based Oracle IDE. The SCOTT schema and its data are already loaded, so there is nothing to install or set up.



#### Learning Path

| #  | Level            | Topic                        | Key Concepts                                   | Status |
| -- | ---------------- | ---------------------------- | ---------------------------------------------- | ------ |
| 1  | **Basic**        | Single-row subqueries        | `=` `>` `<` with one value                     | 🟡     |
| 2  | **Basic**        | Simple joins                 | 2-table join on `deptno`                       | 🟡     |
| 3  | **Basic**        | Top N / Bottom N             | `ROWNUM` + inline view, `FETCH FIRST`          | 🟡     |
| 4  | **Basic**        | `MINUS`                      | Rows in one query, not in another              | 🟡     |
| 5  | **Basic**        | Views                        | `CREATE OR REPLACE VIEW`                       | 🟡     |
| 6  | **Basic+**       | Multiple-row subqueries      | `IN` · `ANY` · `ALL`                           | 🟡     |
| 7  | **Basic+**       | Multiple-column subqueries   | `(col1, col2) IN (...)`                        | 🟡     |
| 8  | **Basic+**       | Self join                    | Employee ↔ manager                             | 🟡     |
| 9  | **Basic+**       | Hierarchical queries         | `START WITH` · `CONNECT BY PRIOR` · `LEVEL`    | 🟡     |
| 10 | **Basic+**       | First / last record          | `MIN` · `MAX` · `ROWID`                        | 🟡     |
| 11 | **Intermediate** | Nth highest salary           | Nested `MAX`, `ROWNUM`                         | ⚪     |
| 12 | **Intermediate** | Correlated subqueries        | Inner query uses outer row                     | ⚪     |
| 13 | **Intermediate** | `GROUP BY` problems          | `HAVING`, per-department results               | ⚪     |
| 14 | **Intermediate** | Ties                         | `FETCH FIRST ... WITH TIES`                    | ⚪     |
| 15 | **Advanced**     | Multi-table joins            | 3+ tables                                      | ⚪     |
| 16 | **Advanced**     | Analytic functions           | `RANK` · `DENSE_RANK` · `ROW_NUMBER`           | ⚪     |
| 17 | **Advanced**     | Complex hierarchies          | `SYS_CONNECT_BY_PATH` · `CONNECT_BY_ROOT`      | ⚪     |
