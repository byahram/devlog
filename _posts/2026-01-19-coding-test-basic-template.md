---
title: "[Python] 코딩테스트 알고리즘 템플릿 - 기본편"
date: 2026-01-19
categories: [코딩테스트]
tags: [python, 코딩테스트, 자료구조, 알고리즘, BFS, DFS, 이진탐색, 힙]
toc: true
image:
  path: /assets/img/thumbnails/coding-test-basic-template.png
  alt: 파이썬 코딩테스트 알고리즘 기본 템플릿
---

## 0. 전체 정리

| 우선순위 | 문제에서 보이는 말 | 바로 생각할 것 |
|---|---|---|
| ★★★★★ | 중복 제거 / 서로 다른 종류 / 존재 여부 | [**Set**](#1-set) |
| ★★★★★ | 개수 / 빈도 / 이름별 저장 / 그룹화 | [**Dict**](#2-dict) |
| ★★★★★ | 큰 순서 / 작은 순서 / 점수순 / 여러 조건 정렬 | [**Sort**](#3-sort) |
| ★★★★★ | 괄호 / 짝 맞추기 / 마지막 넣은 것부터 | [**Stack**](#4-stack) |
| ★★★★★ | 먼저 들어온 것부터 처리 / BFS | [**Queue / Deque**](#5-queue--deque) |
| ★★★★★ | 연결 / 방문 / 그룹 개수 | [**DFS / BFS**](#6-dfs--bfs) |
| ★★★★★ | 상하좌우 / 미로 / N×M / 최단 이동 / 확산 | [**격자 BFS**](#7-격자-bfs) |
| ★★★★★ | 가중치 없는 최단거리 | [**BFS 최단거리**](#8-bfs---가중치-없는-최단거리) |
| ★★★★★ | 모든 경우 / N 작음 | [**완전탐색**](#9-완전탐색) |
| ★★★★★ | k개 선택 / 순서 X | [**Combinations**](#10-combinations) |
| ★★★★★ | k개 선택 / 순서 O | [**Permutations**](#11-permutations) |
| ★★★★☆ | 매 순간 가장 좋은 선택 / 정렬 후 선택 / 최소·최대 반복 | [**Greedy**](#보너스-greedy) |
| ★★★★☆ | 정렬된 배열에서 특정 값 찾기 | [**이진탐색 / Bisect**](#12-이진탐색--bisect) |
| ★★★☆☆ | 가능한 최대값·최솟값 / 이 값이 가능한가? | [**파라메트릭 서치**](#13-파라메트릭-서치) |
| ★★★★☆ | 최소값 / 최대값을 계속 꺼내기 | [**Heapq**](#14-heapq) |
| ★★★★☆ | 연속된 정확히 k개 / 구간 길이 고정 | [**슬라이딩 윈도우**](#15-슬라이딩-윈도우) |
| ★★★★☆ | 연속 구간 + 조건 만족 / 구간 길이 변함 | [**투포인터**](#16-투포인터) |
| ★★★★☆ | 구간 합을 여러 번 구하기 | [**누적합**](#17-누적합) |
| ★★★★☆ | 이전 결과 재사용 / 경우의 수 / 최대·최소 | [**기초 DP**](#18-기초-dp) |
| ★★★☆☆ | 가중치 있는 최단거리 | [**다익스트라**](#19-다익스트라) |

### 우선순위 기준

```text
★★★★★  반드시 익히기
        → 문제를 보면 바로 코드가 떠올라야 함

★★★★☆  중요
        → 키워드를 보고 알고리즘을 선택할 수 있어야 함

★★★☆☆  기본편에서 챙겨두기
        → 템플릿을 보고 적용할 수 있으면 충분
```

### 문제를 읽으면 먼저 확인

```text
① 입력은 무엇인가?
② 출력은 무엇인가?
③ N의 크기는?
④ 결국 무엇을 구하는가?

중복 / 종류 / 개수
→ Set / Dict

정렬 조건 / 순서
→ Sort

괄호 / 짝 맞추기 / 마지막 넣은 것부터
→ Stack

먼저 들어온 것부터 / 순서대로 처리
→ Queue / Deque

연결 / 방문 / 그룹
→ DFS / BFS

N × M / 상하좌우 / 최소 이동
→ 격자 BFS

모든 경우 / N 작음
→ 완전탐색

k개 선택 + 순서 X
→ Combinations

k개 선택 + 순서 O
→ Permutations

정렬 후 현재 가장 좋은 선택 반복
→ Greedy

최솟값 / 최댓값을 계속 꺼냄
→ Heapq

정렬된 배열에서 값 찾기
→ 이진탐색

가능한 최대값 / 최소값
→ 파라메트릭 서치

연속된 정확히 k개
→ 슬라이딩 윈도우

연속 구간 + 길이 변함
→ 투포인터

구간 합 여러 번
→ 누적합

이전 결과 재사용
→ DP

가중치 있는 최단거리
→ 다익스트라
```

---

## 1. Set

→ 중복 제거 / 서로 다른 종류 / 존재 여부

### 기본

```python
s = set(arr)
```

### 존재 확인

```python
if x in s:
```

### 서로 다른 개수

```python
len(set(arr))
```

### 값 추가

```python
s.add(x)
```

### 핵심

```text
중복 제거 → set(arr)
존재 확인 → x in s
서로 다른 개수 → len(set(arr))
```

---

## 2. Dict

→ 개수 / 빈도 / 이름별 저장 / 그룹화

### 개수 세기

```python
d = {}

for x in arr:
    d[x] = d.get(x, 0) + 1
```

### 값 여러 개 저장

```python
d = {}

for key, value in data:
    if key not in d:
        d[key] = []

    d[key].append(value)
```

### 가장 많이 등장한 것

```python
answer = max(d, key=d.get)
```

### 존재 확인

```python
if key in d:
```

### 핵심

```text
개수 / 빈도
→ d[x] = d.get(x, 0) + 1

이름 → 값
key → value
→ dict
```

---

## 3. Sort

→ 큰 순서 / 작은 순서 / 점수순 / 여러 조건 정렬

### 기본

```python
arr.sort()
```

### 내림차순

```python
arr.sort(reverse=True)
```

### 특정 값 기준

```python
arr.sort(key=lambda x: x[1])
```

### 여러 조건 기준

```python
arr.sort(key=lambda x: (-x[1], x[0]))
```

```text
-x[1] → 큰 순서
 x[0] → 작은 순서
```

예)

```text
점수 높은 순
+
점수가 같으면 번호 작은 순
```

```python
arr.sort(key=lambda x: (-x[1], x[0]))
```

### sort / sorted 차이

```python
arr.sort()             # 원본 변경

new_arr = sorted(arr)  # 새로운 리스트
```

### 핵심

```text
작은 순 → sort()
큰 순 → sort(reverse=True)

여러 조건
→ lambda

내림차순 조건
→ - 붙이기
```

---

## 4. Stack

→ 괄호 / 짝 맞추기 / 마지막 넣은 것부터

### 기본

```python
stack = []

stack.append(x)
stack.pop()

stack[-1]  # 마지막 값 확인
```

### 괄호 문제

```python
stack = []

for x in s:
    if x == '(':
        stack.append(x)

    else:
        if not stack:
            return False

        stack.pop()

return len(stack) == 0
```

### 핵심

```text
마지막에 넣은 것부터 꺼냄
→ Stack

넣기 → append()
꺼내기 → pop()
```

---

## 5. Queue / Deque

→ 먼저 들어온 것부터 처리 / BFS

### 기본

```python
from collections import deque

q = deque()

q.append(x)     # 뒤에 넣기
x = q.popleft() # 앞에서 꺼내기
```

### 양쪽에서 처리할 때

```python
q.append(x)
q.appendleft(x)

q.pop()
q.popleft()
```

### 핵심

```text
먼저 들어온 것부터 꺼냄
→ Queue

BFS
→ deque

넣기 → append()
꺼내기 → popleft()
```

---

## 6. DFS / BFS

→ 연결 / 방문 / 그룹 개수

### DFS

→ 한 방향으로 깊게 탐색

```python
import sys
sys.setrecursionlimit(10**6)

visited = [False] * (n + 1)

def dfs(cur):
    visited[cur] = True

    for nxt in graph[cur]:
        if not visited[nxt]:
            dfs(nxt)
```

### BFS

→ 가까운 곳부터 탐색

```python
from collections import deque

visited = [False] * (n + 1)

def bfs(start):
    q = deque([start])
    visited[start] = True

    while q:
        cur = q.popleft()

        for nxt in graph[cur]:
            if not visited[nxt]:
                visited[nxt] = True
                q.append(nxt)
```

### 연결된 덩어리 개수

```python
visited = [False] * (n + 1)
count = 0

for i in range(1, n + 1):
    if not visited[i]:
        dfs(i)
        count += 1
```

### 구분

```text
연결된 곳 전부 방문
→ DFS / BFS

연결된 덩어리 개수
→ DFS / BFS

깊게 탐색 / 모든 경우 탐색
→ DFS

가까운 곳부터 탐색
→ BFS

가중치 없는 최단거리
→ BFS

DFS → 재귀 / Stack
BFS → Queue(deque)
```

---

## 7. 격자 BFS

→ 상하좌우 / 미로 / 2차원 맵 / 최단 이동 / 확산

### 기본

```python
from collections import deque

dist = [[-1] * M for _ in range(N)]

q = deque([(0, 0)])
dist[0][0] = 0

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

while q:
    x, y = q.popleft()

    for i in range(4):
        nx = x + dx[i]
        ny = y + dy[i]

        if 0 <= nx < N and 0 <= ny < M:
            if graph[nx][ny] == 1 and dist[nx][ny] == -1:
                dist[nx][ny] = dist[x][y] + 1
                q.append((nx, ny))
```

`graph[nx][ny] == 1`은 문제의 이동 가능 조건에 맞게 변경

### 방문 여부만 필요하면

```python
visited = [[False] * M for _ in range(N)]
```

거리까지 필요하면 `visited` 대신 `dist` 사용

```python
dist = [[-1] * M for _ in range(N)]

dist[start_x][start_y] = 0

# 다음 칸
dist[nx][ny] = dist[x][y] + 1
```

### 핵심

```text
① 시작점 Queue에 넣기
② 방문 / 거리 처리

③ 현재 위치 꺼내기
④ 상하좌우 확인

⑤ 범위 안인가?
⑥ 이동 가능한가?
⑦ 아직 방문 안 했는가?

⑧ 방문 / 거리 처리
⑨ Queue에 넣기
```

### 바로 떠올리기

```text
상하좌우
N × M
미로
최소 이동
토마토 / 바이러스 확산

→ 격자 BFS
```

---

## 8. BFS - 가중치 없는 최단거리

→ 가중치 없는 그래프의 최단거리

- `dist = -1`을 방문 여부 + 거리 저장으로 같이 사용
- BFS에서 처음 방문했을 때의 거리가 최단거리

### 기본

```python
from collections import deque

dist = [-1] * (n + 1)

q = deque([start])
dist[start] = 0

while q:
    cur = q.popleft()

    for nxt in graph[cur]:
        if dist[nxt] == -1:
            dist[nxt] = dist[cur] + 1
            q.append(nxt)
```

### 특정 목적지

```python
print(dist[target])
```

### 최단거리 구분

```text
가중치 없는 일반 그래프
→ BFS

가중치 없는 2차원 격자
→ 격자 BFS

가중치 있는 그래프
→ 다익스트라
```

### 핵심 암기

```text
BFS 최단거리

시작점 = 0

다음 노드 =
현재 거리 + 1

dist[nxt] = dist[cur] + 1
```

---

## 9. 완전탐색

→ 모든 경우 확인 / N 작음

### 기본

```python
answer = 0

for i in range(n):
    for j in range(n):
        # 모든 경우 확인
        pass
```

### 바로 떠올리기

```text
모든 경우
가능한 모든 방법
N이 작음
모든 경우 중 최댓값 / 최솟값

→ 완전탐색
```

- 경우의 수가 너무 많으면 완전탐색 불가능

---

## 10. Combinations

→ k개 선택 / 순서 상관 X / 완전탐색

```python
from itertools import combinations

for comb in combinations(arr, k):
    # comb 사용
    pass
```

### 합이 특정 값인 조합

```python
answer = 0

for comb in combinations(arr, 3):
    if sum(comb) == 9:
        answer += 1
```

### 핵심

```text
몇 개 선택
k명 뽑기
카드 k개 고르기
순서 상관 없음

→ combinations

(A, B) = (B, A)
```

---

## 11. Permutations

→ k개 선택 / 순서 O / 완전탐색

```python
from itertools import permutations

for p in permutations(arr, k):
    # p 사용
    pass
```

### 중복 선택까지 가능하면

```python
from itertools import product

for p in product(arr, repeat=k):
    # p 사용
    pass
```

### 핵심

```text
선택 + 순서 X
→ combinations

선택 + 순서 O
→ permutations

중복 선택 O + 순서 O
→ product
```

```text
줄 세우기
방문 순서
모든 순서

→ permutations

(A, B) ≠ (B, A)
```

---

## 12. 이진탐색 / Bisect

→ 정렬된 배열에서 특정 값 찾기

- **전제**: 배열이 정렬되어 있어야 함
- **시간복잡도**: `O(log N)`

### 직접 구현

```python
def binary_search(arr, target):
    left = 0
    right = len(arr) - 1

    while left <= right:
        mid = (left + right) // 2

        if arr[mid] == target:
            return mid

        elif arr[mid] < target:
            left = mid + 1

        else:
            right = mid - 1

    return -1
```

### bisect로 값 찾기

```python
from bisect import bisect_left

idx = bisect_left(arr, target)

if idx < len(arr) and arr[idx] == target:
    print("있음")
```

### 특정 값의 개수

```python
from bisect import bisect_left, bisect_right

count = bisect_right(arr, target) - bisect_left(arr, target)
```

### 핵심

```text
정렬된 배열에서 값 찾기
→ 이진탐색 / bisect

특정 값 개수
→ bisect_right - bisect_left

가능한 최대값 / 최소값
→ 파라메트릭 서치
```

---

## 13. 파라메트릭 서치

→ 가능한 최대값·최솟값 / 이 값이 가능한가?

→ 정답 자체를 이진탐색

### 가능한 최대값 찾기

```python
left = 최소값
right = 최대값
answer = 0

while left <= right:
    mid = (left + right) // 2

    if 가능한가(mid):
        answer = mid
        left = mid + 1

    else:
        right = mid - 1
```

### 가능한 최소값 찾기

```python
left = 최소값
right = 최대값

while left <= right:
    mid = (left + right) // 2

    if 가능한가(mid):
        answer = mid
        right = mid - 1

    else:
        left = mid + 1
```

### 핵심

```text
최대 몇 명?
최소 얼마?
가장 큰 가능한 값?
가장 작은 가능한 값?
이 값으로 가능한가?

→ 파라메트릭 서치
```

### 최대 / 최소 방향 암기

```text
가능한 최대값 찾기
→ 가능하면 더 크게
→ left = mid + 1

가능한 최소값 찾기
→ 가능하면 더 작게
→ right = mid - 1
```

---

## 14. Heapq

→ 최소값 / 최대값을 계속 꺼내기

- Python `heapq`는 기본적으로 최소 힙

### 최소 힙

```python
import heapq

heap = []

heapq.heappush(heap, x)
x = heapq.heappop(heap)
```

### 최솟값 확인

```python
heap[0]
```

### 최대 힙처럼 사용

```python
heapq.heappush(heap, -x)
x = -heapq.heappop(heap)
```

### 핵심

```text
최솟값을 계속 꺼내기
→ heapq

최댓값을 계속 꺼내기
→ 음수로 넣기
```

---

## 15. 슬라이딩 윈도우

→ 연속된 정확히 `k`개 / 구간 길이 고정

### 연속된 k개의 합

```python
window = sum(arr[:k])
answer = window

for i in range(k, len(arr)):
    window += arr[i]
    window -= arr[i-k]

    answer = max(answer, window)
```

### 핵심

```text
새로운 값 추가
+
빠진 값 제거

연속된 정확히 k개
→ 슬라이딩 윈도우
```

---

## 16. 투포인터

→ 연속 구간 + 조건 만족 / 구간 길이가 변함

- 부분합 방식은 보통 원소가 양수일 때 사용

### 기본

```python
left = 0
total = 0

for right in range(len(arr)):
    total += arr[right]

    while total > target:
        total -= arr[left]
        left += 1

    if total == target:
        # 정답 처리
        pass
```

### 핵심

```text
right 이동
→ 값 추가

조건을 넘으면
→ left 값 제거
→ left 이동
```

### 슬라이딩 윈도우와 구분

```text
연속된 정확히 k개
→ 슬라이딩 윈도우
→ 길이 고정

연속 구간 + 조건 만족
→ 투포인터
→ 길이 변함
```

---

## 17. 누적합

→ 구간 합을 여러 번 구하기

- 누적합을 미리 만들면 구간 합을 `O(1)`에 계산 가능

### 기본

```python
prefix = [0]

for x in arr:
    prefix.append(prefix[-1] + x)
```

```text
prefix[i]
= 처음부터 i개까지의 합
```

### 구간 합 [left, right)

```python
result = prefix[right] - prefix[left]
```

### 구간 합 [left, right]

```python
result = prefix[right + 1] - prefix[left]
```

### 핵심

```text
한 번만 합 구하기
→ sum()

구간 합을 여러 번 구하기
→ 누적합

구간합
= 오른쪽 누적합 - 왼쪽 누적합
```

---

## 18. 기초 DP

→ 이전 결과 재사용 / 경우의 수 / 최대·최소

- 같은 계산을 반복하지 않고 결과를 `dp`에 저장
- 가장 중요한 것은 `dp[i]의 의미`와 `점화식`

### 기본형

```python
dp = [0] * (n + 1)

# 초기값
dp[0] = ...

for i in range(1, n + 1):
    dp[i] = ...
```

### 피보나치 형태

```python
dp[0] = 0
dp[1] = 1

for i in range(2, n + 1):
    dp[i] = dp[i-1] + dp[i-2]
```

### 최대 / 최소 형태

```python
dp[i] = max(dp[i-1], dp[i-2] + value)
```

또는

```python
dp[i] = min(...)
```

### DP 문제 풀이 순서

```text
① dp[i]가 무엇인지 정하기
② 초기값 정하기
③ 점화식 찾기
④ 작은 값부터 계산
```

### 바로 떠올리기

```text
경우의 수 / 방법의 수
최대값 / 최소값
최소 비용 / 최대 점수

같은 계산이 반복됨
같은 상태의 답을 여러 번 다시 계산하게 됨
이전 결과를 재사용할 수 있음

→ DP 의심
```

---

## 19. 다익스트라

→ 가중치 있는 그래프의 최단거리

- **조건**: 음수 가중치가 없어야 함
- **핵심**: `heapq`로 현재 거리가 가장 짧은 노드부터 처리
- **시간복잡도**: `O(E log V)`

### 그래프 입력

```python
graph = [[] for _ in range(n + 1)]

for _ in range(m):
    a, b, cost = map(int, input().split())
    graph[a].append((b, cost))
```

```text
graph[a]
→ [(도착 노드, 비용), ...]
```

### 기본코드

```python
import heapq

INF = int(1e9)
distance = [INF] * (n + 1)

def dijkstra(start):
    q = []

    heapq.heappush(q, (0, start))
    distance[start] = 0

    while q:
        dist, now = heapq.heappop(q)

        if distance[now] < dist:
            continue

        for nxt, cost in graph[now]:
            new_cost = dist + cost

            if new_cost < distance[nxt]:
                distance[nxt] = new_cost
                heapq.heappush(q, (new_cost, nxt))
```

### 특정 목적지

```python
dijkstra(start)

print(distance[target])
```

### 핵심

```text
heap에
→ (거리, 노드)

꺼내서
→ 연결된 노드 확인

새 거리
→ dist + cost

기존 거리보다 짧으면
→ distance 갱신
→ heap에 넣기
```

### 최단거리 구분

```text
가중치 없음
→ BFS

가중치 있음 + 음수 가중치 없음
→ 다익스트라
```

---

## 보너스. Greedy

→ 매 순간 가장 좋은 선택 / 정렬 후 선택

- 현재 가장 좋아 보이는 선택을 반복
- 그 선택이 전체 최적해로 이어지는 문제에서 사용
- 문제마다 풀이 방법이 달라 정해진 하나의 템플릿은 없음

### 바로 떠올리기

```text
가장 큰 것부터
가장 작은 것부터
최대한 많이
최소 개수
정렬한 뒤 순서대로 선택

→ Greedy 의심
```

### 기본 형태

```python
arr.sort()

answer = 0

for x in arr:
    if 선택_가능(x):
        # 현재 가장 좋은 선택
        answer += 1
```

> 실제 선택 기준과 정렬 방향은 문제에 맞게 변경

### 핵심

```text
① 문제에 맞는 선택 기준 정하기
② 필요하면 정렬
③ 현재 가장 좋은 선택 반복

중요
→ 현재의 최선 선택이
   전체 최적해로 이어지는지 확인
```
