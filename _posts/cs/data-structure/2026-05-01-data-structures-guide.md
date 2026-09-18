---
title: "[DS] 0. 자료구조 학습 지도"
date: 2026-05-01
categories: [CS, 자료구조]
tags: [자료구조]
toc: true
mermaid: true
comments: false
---

배열, 리스트, 스택, 큐, 트리 등 기본 자료구조를 공부한다. 데이터를 찾거나 추가하고 삭제할 때 드는 비용과, 각 구조를 언제 쓰는지 정리한다.

## 개념 지도

```mermaid
flowchart LR
    ds["자료구조"] --- overview["자료구조의 큰 그림"]
    overview --- complexity["시간 복잡도와 공간 복잡도"]

    ds --- structures["주요 자료구조"]
    structures --- array["배열과 연결 리스트"]
    structures --- stack["스택과 큐"]

    structures --- hash["해시 테이블"]
    hash --- hash_func["해시 함수"]
    hash --- hash_collision["해시 충돌"]

    structures --- tree["트리"]
    tree --- tree_types["다양한 트리의 종류"]

    structures --- graphNode["그래프"]
    graphNode --- dfs["깊이 우선 탐색"]
    graphNode --- bfs["너비 우선 탐색"]
    graphNode --- shortest_path["최단 경로 알고리즘"]
```

<br>

## 정렬 알고리즘 시간 복잡도

| 정렬 알고리즘 | 시간 복잡도 |
| :--- | :--- |
| 삽입 정렬 | O(n²) |
| 선택 정렬 | O(n²) |
| 버블 정렬 | O(n²) |
| 병합 정렬 | O(n log n) |
| 퀵 정렬 | O(n log n) |
| 힙 정렬 | O(n log n) |

<br>

## 주요 알고리즘 시간 복잡도

| 알고리즘 | 시간 복잡도 |
| :--- | :--- |
| 순차 탐색 | O(n) |
| 이진 탐색 | O(log n) |
| 깊이 우선 탐색 | O(V + E) |
| 너비 우선 탐색 | O(V + E) |
| 다익스트라 알고리즘 | O(E log V) |
| 플로이드-워셜 알고리즘 | O(V³) |
| 크루스칼 알고리즘 | O(E log V) |
| 프림 알고리즘 | O(E log V) |



<!-- ## 공부 순서

1. [시간 복잡도와 공간 복잡도]({% post_url cs/data-structure/2026-06-28-coding-test-example %}) — 기존 코드 분석과 점근 표기
1. [배열과 연결 리스트]({% post_url cs/data-structure/2026-08-13-arrays-linked-lists %})
1. [스택과 큐]({% post_url cs/data-structure/2026-08-14-stacks-queues %})
1. [해시 테이블과 충돌]({% post_url cs/data-structure/2026-08-15-hash-tables-collisions %})
1. [트리와 탐색]({% post_url cs/data-structure/2026-08-16-trees-search %})
1. [그래프 구현 예시: 코딩테스트 심화 템플릿]({% post_url coding-test/2026-01-20-coding-test-advanced-template %}) -->

[전체 CS 학습 지도로 돌아가기]({% post_url cs/2026-05-01-cs %})
