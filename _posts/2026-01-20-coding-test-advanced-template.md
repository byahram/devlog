---
title: "[Python] 코딩테스트 알고리즘 템플릿 - 심화편"
date: 2026-01-20
categories: [코딩테스트]
tags: [python, 코딩테스트, 그래프, 최단거리, Union-Find, 위상정렬, MST, 누적합]
toc: true
image:
  path: /assets/img/thumbnails/coding-test-advanced-template.png
  alt: 파이썬 코딩테스트 알고리즘 심화 템플릿
---

# 코딩테스트 알고리즘 템플릿 - 심화편

> 기본편 1~19를 먼저 익힌 뒤 추가로 보기

## 0. 전체 정리

| 우선순위 | 문제에서 보이는 말 | 바로 생각할 것 |
|---|---|---|
| ★★★ | 같은 그룹 / 그룹 합치기 / 사이클 판별 | [**Union-Find**](#21-유니온-파인드) |
| ★★★ | N 이하 모든 소수 / 소수 여러 개 | [**에라토스테네스의 체**](#27-에라토스테네스의-체) |
| ★★★ | 작업 순서 / 선행 조건 / 선수 과목 | [**위상 정렬**](#22-위상-정렬) |
| ★★ | 모든 노드 → 모든 노드 최단거리 | [**플로이드 워셜**](#20-플로이드-워셜) |
| ★★ | 직사각형 영역의 합을 여러 번 | [**2차원 누적합**](#25-2차원-누적합) |
| ★★ | 오큰수 / 오른쪽에서 처음 만나는 더 큰 값 | [**단조 스택**](#26-단조-스택) |
| ★★ | 모든 노드를 최소 비용으로 연결 | [**Kruskal**](#23-크루스칼) |
| ★ | 트리 / 가장 가까운 공통 조상 | [**LCA**](#24-lca) |

### 우선순위 기준

```text
★★★  심화 중 우선적으로 익히기
     → 키워드를 보면 알고리즘이 떠오를 정도

★★   여유가 있으면 챙기기
     → 템플릿을 보고 적용할 수 있으면 충분

★    낮은 우선순위
     → 개념과 문제 키워드 정도만 알아두기
```

---

## 20. 플로이드 워셜

→ 모든 노드 → 모든 노드 최단거리

- 모든 노드 쌍의 최단거리를 구할 때
- 노드 수가 비교적 작을 때 사용
- 시간복잡도: `O(N³)`

### 그래프 초기화

```python
INF = int(1e9)

graph = [[INF] * (n + 1) for _ in range(n + 1)]

for i in range(1, n + 1):
    graph[i][i] = 0

for _ in range(m):
    a, b, cost = map(int, input().split())

    graph[a][b] = min(graph[a][b], cost)
```

무방향 그래프라면:

```python
graph[a][b] = min(graph[a][b], cost)
graph[b][a] = min(graph[b][a], cost)
```

### 기본코드

```python
for k in range(1, n + 1):
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            graph[i][j] = min(
                graph[i][j],
                graph[i][k] + graph[k][j]
            )
```

### 핵심

```text
i → j로 바로 가는 거리

vs

i → k → j로 가는 거리

→ 더 작은 값으로 갱신
```

### 최단거리 구분

```text
가중치 없음
→ BFS

한 시작점 → 다른 노드들
+ 가중치 있음
→ 다익스트라

모든 노드 → 모든 노드
→ 플로이드 워셜
```

---

## 21. 유니온 파인드

→ 같은 그룹인지 확인 / 그룹 합치기 / 사이클 판별

### 초기화

```python
parent = [i for i in range(n + 1)]
```

### Find

```python
def find_parent(parent, x):
    if parent[x] != x:
        parent[x] = find_parent(parent, parent[x])

    return parent[x]
```

### Union

```python
def union_parent(parent, a, b):
    a = find_parent(parent, a)
    b = find_parent(parent, b)

    if a < b:
        parent[b] = a
    else:
        parent[a] = b
```

### 같은 그룹인지 확인

```python
if find_parent(parent, a) == find_parent(parent, b):
    print("같은 그룹")
```

### 핵심

```text
Find
→ 어느 그룹인지 찾기

Union
→ 두 그룹 합치기

같은 집합?
연결되어 있는가?
사이클?

→ Union-Find
```

---

## 22. 위상 정렬

→ 순서가 정해진 작업 / 선행 조건

- 방향 그래프에서 선행 관계에 맞게 순서 정하기
- DAG(사이클 없는 방향 그래프)에서 사용
- `indegree` = 해당 노드로 들어오는 간선 개수

### 기본코드

```python
from collections import deque

q = deque()

for i in range(1, n + 1):
    if indegree[i] == 0:
        q.append(i)

result = []

while q:
    now = q.popleft()
    result.append(now)

    for nxt in graph[now]:
        indegree[nxt] -= 1

        if indegree[nxt] == 0:
            q.append(nxt)
```

### 사이클 확인

```python
if len(result) != n:
    print("사이클 존재")
```

### 핵심

```text
진입차수 0
→ Queue에 넣기

꺼내기
→ 연결된 노드의 진입차수 -1

새롭게 0이 되면
→ Queue에 넣기

결과 노드 수 < n
→ 사이클 존재
```

### 바로 떠올리기

```text
선수 과목
작업 순서
먼저 해야 하는 작업
선행 조건

→ 위상 정렬
```

---

## 23. 크루스칼

→ 모든 노드를 최소 비용으로 연결 / MST

- 간선을 비용이 작은 순서대로 선택
- 사이클 방지를 위해 Union-Find 사용
- `edges`는 `(비용, 노드1, 노드2)` 형태로 저장

### 간선 입력

```python
edges = []

for _ in range(m):
    a, b, cost = map(int, input().split())
    edges.append((cost, a, b))
```

### 기본코드

```python
# find_parent / union_parent는 21. Union-Find 사용

parent = [i for i in range(n + 1)]

edges.sort()
total_cost = 0

for cost, a, b in edges:
    if find_parent(parent, a) != find_parent(parent, b):
        union_parent(parent, a, b)
        total_cost += cost
```

### 핵심

```text
① 간선을 비용순 정렬

② 가장 싼 간선부터 확인

③ 서로 다른 그룹이면
   → 연결
   → 비용 추가

④ 같은 그룹이면
   → 사이클이 생기므로 무시
```

### 바로 떠올리기

```text
모든 노드 연결
+
최소 비용

→ MST
→ Kruskal
```

---

## 24. LCA

→ 트리에서 두 노드의 가장 가까운 공통 조상

### 기본 LCA

```python
def lca(a, b):

    # 깊이 맞추기
    while depth[a] != depth[b]:
        if depth[a] > depth[b]:
            a = parent[a]
        else:
            b = parent[b]

    # 같이 올라가기
    while a != b:
        a = parent[a]
        b = parent[b]

    return a
```

### 핵심

```text
① 두 노드의 깊이를 맞춤
② 부모를 따라 같이 올라감
③ 처음 같아진 노드 = LCA
```

### 바로 떠올리기

```text
트리
두 노드
가장 가까운 공통 조상

→ LCA
```

> 여러 LCA 쿼리를 빠르게 처리하는 이진 리프팅은 현재 범위에서는 제외

---

## 25. 2차원 누적합

→ 직사각형 영역의 합을 여러 번 구하기

### 누적합 만들기

```python
ps = [[0] * (M + 1) for _ in range(N + 1)]

for i in range(1, N + 1):
    for j in range(1, M + 1):
        ps[i][j] = (
            ps[i-1][j]
            + ps[i][j-1]
            - ps[i-1][j-1]
            + board[i-1][j-1]
        )
```

### 직사각형 합

아래 함수는:

```text
(r1, c1) ~ (r2, c2)
→ 0-based
→ 양 끝 포함
```

```python
def rect_sum(r1, c1, r2, c2):
    return (
        ps[r2+1][c2+1]
        - ps[r1][c2+1]
        - ps[r2+1][c1]
        + ps[r1][c1]
    )
```

### 핵심

```text
전체
- 위쪽
- 왼쪽
+ 두 번 빠진 부분
```

```text
1차원 구간 합 여러 번
→ 누적합

2차원 직사각형 합 여러 번
→ 2차원 누적합
```

---

## 26. 단조 스택

→ 오큰수 / 오른쪽에서 처음 만나는 더 큰 값

### 오큰수

```python
answer = [-1] * n
stack = []

for i in range(n):
    while stack and arr[stack[-1]] < arr[i]:
        idx = stack.pop()
        answer[idx] = arr[i]

    stack.append(i)
```

### 핵심

```text
stack에는 인덱스 저장

현재 값이
stack top의 값보다 크면

→ pop
→ 현재 값이 오큰수
```

### 바로 떠올리기

```text
오큰수
오른쪽에서 처음 만나는 큰 수
가장 가까운 더 큰 값

→ 단조 스택
```

---

## 27. 에라토스테네스의 체

→ N 이하의 모든 소수 구하기

### 소수 하나 판별

```python
def is_prime(x):
    if x < 2:
        return False

    for i in range(2, int(x ** 0.5) + 1):
        if x % i == 0:
            return False

    return True
```

### N 이하의 모든 소수

```python
n = 1000

is_prime = [True] * (n + 1)
is_prime[0] = is_prime[1] = False

for i in range(2, int(n ** 0.5) + 1):
    if is_prime[i]:
        for j in range(i * i, n + 1, i):
            is_prime[j] = False
```

### 소수 출력

```python
for i in range(2, n + 1):
    if is_prime[i]:
        print(i)
```

### 핵심

```text
소수 하나 판별
→ 2 ~ √N 확인

N 이하의 모든 소수
→ 에라토스테네스의 체

소수의 배수들을
→ False 처리
```