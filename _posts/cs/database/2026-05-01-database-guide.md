---
title: "데이터베이스 학습 지도"
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
    overview --- schema["엔터티와 스키마"]
    overview --- transaction["트랜잭션과 ACID"]
    db --- relational["RDBMS와 SQL"]
    relational --- basics["RDBMS의 기본"]
    relational --- sql["SQL"]
    relational --- query["효율적 쿼리"]
    relational --- design["데이터베이스 설계"]
    db --- nosql["NoSQL"]
    nosql --- features["NoSQL의 특징"]
    nosql --- products["다양한 NoSQL: MongoDB와 Redis"]
```


<!-- ## 공부 순서

1. [관계형 데이터 모델과 키]({% post_url cs/database/2026-08-25-relational-model-keys %})
1. [트랜잭션과 ACID]({% post_url cs/database/2026-08-26-transactions-acid %})
1. [SQL: 테이블·데이터 조작부터 JOIN·서브쿼리·뷰까지]({% post_url cs/database/2026-08-27-sql-basics %})
1. [B+ 트리와 데이터베이스 인덱스]({% post_url cs/database/2026-08-28-bplus-tree-indexes %})
1. [정규화와 역정규화]({% post_url cs/database/2026-08-29-normalization %})
1. [NoSQL과 MongoDB·Redis]({% post_url cs/database/2026-08-30-nosql-mongodb-redis %}) -->

[전체 CS 학습 지도로 돌아가기]({% post_url cs/2026-05-01-cs %})
