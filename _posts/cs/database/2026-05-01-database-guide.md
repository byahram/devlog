---
title: "[DB] 0. 데이터베이스 학습 지도"
date: 2026-05-01
categories: [CS, 데이터베이스]
tags: [데이터베이스]
toc: true
mermaid: true
comments: false
---

데이터를 테이블에 저장하고 SQL로 조회하는 방법부터 공부한다. 트랜잭션, 인덱스, 테이블 설계와 NoSQL도 정리한다.

## 개념 지도

```mermaid
flowchart LR
    db["데이터베이스"] --- overview["데이터베이스의 큰 그림"]
    overview --- dbms["데이터베이스와 DBMS"]
    overview --- files["데이터베이스 vs 파일 시스템"]
    overview --- schema["엔티티와 스키마"]
    overview --- tx["트랜잭션과 ACID"]

    db --- rdbms_basics["RDBMS의 기본"]
    rdbms_basics --- table_structure["테이블의 구성"]
    table_structure --- field_type["필드 타입"]
    table_structure --- keys["키"]
    rdbms_basics --- table_rel["테이블의 관계(매핑)"]
    table_rel --- rel_1_1["일대일 대응 관계"]
    table_rel --- rel_1_n["일대다 대응 관계"]
    table_rel --- rel_n_m["다대다 대응 관계"]
    rdbms_basics --- integrity["무결성 제약 조건"]
    integrity --- domain_integ["도메인 제약 조건"]
    integrity --- key_integ["키 제약 조건"]
    integrity --- entity_integ["엔티티 무결성 제약 조건"]
    integrity --- referential_integ["참조 무결성 제약 조건"]

    db --- sql["SQL"]
    sql --- ddl["데이터 정의 언어(DDL)<br/>CREATE, ALTER, DROP, TRUNCATE"]
    sql --- dml["데이터 조작 언어(DML)<br/>INSERT, UPDATE, DELETE, SELECT"]
    sql --- tcl["트랜잭션 제어 언어(TCL)<br/>COMMIT, ROLLBACK, SAVEPOINT"]
    sql --- dcl["데이터 제어 언어(DCL)<br/>GRANT, REVOKE"]

    db --- query["효율적 쿼리"]
    query --- subquery["서브 쿼리"]
    query --- join["조인"]
    join --- inner_join["INNER 조인"]
    join --- outer_join["OUTER 조인"]
    query --- view["뷰"]
    query --- index["인덱스"]

    db --- design["데이터베이스 설계"]
    design --- erd["ER 다이어그램"]
    design --- normalization["정규화"]
    normalization --- nf1["제1 정규형"]
    normalization --- nf2["제2 정규형"]
    normalization --- nf3["제3 정규형"]
    normalization --- bcnf["보이스/코드 정규형"]

    db --- nosql["NoSQL"]
    nosql --- rdb_vs_nosql["RDBMS vs NoSQL"]
    nosql --- nosql_types["NoSQL의 종류"]
    nosql_types --- kv_store["키-값 데이터베이스"]
    nosql_types --- doc_store["도큐먼트 데이터베이스"]
    nosql_types --- graph_store["그래프 데이터베이스"]
    nosql_types --- column_store["칼럼 패밀리 데이터베이스"]
    nosql --- nosql_products["다양한 NoSQL"]
    nosql_products --- mongodb["MongoDB"]
    nosql_products --- redis["Redis"]

    tx ~~~ table_structure
    referential_integ ~~~ ddl
    dcl ~~~ subquery
    index ~~~ erd
    bcnf ~~~ rdb_vs_nosql
```


<!-- ## 공부 순서

1. [관계형 데이터 모델과 키]({% post_url cs/database/2026-08-25-relational-model-keys %})
1. [트랜잭션과 ACID]({% post_url cs/database/2026-08-26-transactions-acid %})
1. [SQL: 테이블·데이터 조작부터 JOIN·서브쿼리·뷰까지]({% post_url cs/database/2026-08-27-sql-basics %})
1. [B+ 트리와 데이터베이스 인덱스]({% post_url cs/database/2026-08-28-bplus-tree-indexes %})
1. [정규화와 역정규화]({% post_url cs/database/2026-08-29-normalization %})
1. [NoSQL과 MongoDB·Redis]({% post_url cs/database/2026-08-30-nosql-mongodb-redis %}) -->

[전체 CS 학습 지도로 돌아가기]({% post_url cs/2026-05-01-cs %})
