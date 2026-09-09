---
title: "[Python] 코딩테스트 필수 문법 치트시트"
date: 2026-01-18
categories: [Coding Test]
tags: [python, 코딩테스트, 문법, 자료구조, 표준라이브러리]
toc: true
image:
  path: /assets/img/thumbnails/coding-test-syntax-cheatsheet.png
  alt: 파이썬 코딩테스트 필수 문법 치트시트
---

# 코딩테스트 필수 문법 치트시트

→ 알고리즘을 구현할 때 자주 사용하는 Python 문법과 실수하기 쉬운 부분 정리

## 0. 전체 정리

| 필요한 것 | 바로 생각할 것 |
|---|---|
| 여러 정수 입력 | `map(int, input().split())` |
| 빠른 입력 | `sys.stdin.readline` |
| 몫 / 나머지 | `//` / `%` |
| 몫 + 나머지 | `divmod()` |
| 최댓값 / 최솟값 | `max()` / `min()` |
| 합 / 길이 | `sum()` / `len()` |
| 리스트 뒤집기 | `[::-1]` |
| 인덱스 + 값 | `enumerate()` |
| 여러 리스트 같이 순회 | `zip()` |
| 리스트 → 문자열 | `"".join()` |
| 2차원 리스트 초기화 | `[[0] * M for _ in range(N)]` |
| 빈도 세기 | `Counter` / `dict.get()` |
| 큐 | `deque` |
| 최대공약수 / 최소공배수 | `math.gcd()` / `math.lcm()` |
| 리스트 복사 | `a.copy()` / `[row[:] for row in a]` / `copy.deepcopy()` |
| 재귀 DFS | `sys.setrecursionlimit()` |

---

## 1. 입력 / 출력

### 기본 입력

```python
n = int(input())

a, b = map(int, input().split())

arr = list(map(int, input().split()))
```

### 여러 줄 입력

```python
N = int(input())

arr = []

for _ in range(N):
    arr.append(int(input()))
```

### 2차원 배열 입력

```python
N, M = map(int, input().split())

board = [
    list(map(int, input().split()))
    for _ in range(N)
]
```

### 공백 없는 숫자 격자

```text
10101
11100
00111
```

```python
board = [
    list(map(int, input().strip()))
    for _ in range(N)
]
```

### 빠른 입력

```python
import sys
input = sys.stdin.readline
```

문자열:

```python
s = input().rstrip()
```

숫자는 보통 그대로 사용 가능:

```python
n = int(input())
arr = list(map(int, input().split()))
```

### 출력

```python
arr = [1, 2, 3]

print(*arr)
# 1 2 3
```

여러 줄 출력:

```python
print("\n".join(map(str, answer)))
```

### f-string

```python
name = "A"
score = 100

print(f"{name} {score}")
```

---

## 2. 기본 연산

### 사칙연산

```python
7 + 3    # 10
7 - 3    # 4
7 * 3    # 21

7 / 3    # 2.333...
7 // 3   # 2
7 % 3    # 1

2 ** 3   # 8
```

### 몫 / 나머지

```python
q = a // b
r = a % b
```

몫과 나머지를 동시에:

```python
q, r = divmod(a, b)
```

```text
//       → 몫
%        → 나머지
divmod() → 몫 + 나머지
```

### 절댓값

```python
abs(-5)
# 5
```

### 최댓값 / 최솟값 / 합 / 길이

```python
max(arr)
min(arr)
sum(arr)
len(arr)
```

여러 값:

```python
max(a, b, c)
min(a, b, c)
```

### 기준을 정해서 최대 / 최소 찾기

```python
arr = [(1, 5), (2, 3), (3, 7)]

max(arr, key=lambda x: x[1])
# (3, 7)

min(arr, key=lambda x: x[1])
# (2, 3)
```

딕셔너리에서 가장 큰 value의 key:

```python
answer = max(d, key=d.get)
```

---

## 3. List

### 기본

```python
arr = []

arr.append(x)
arr.pop()

arr[0]
arr[-1]

len(arr)
```

### 초기화

```python
arr = [0] * N
visited = [False] * N
```

### 리스트 컴프리헨션

```python
arr = [i for i in range(10)]
```

조건 추가:

```python
arr = [i for i in range(10) if i % 2 == 0]
```

### 2차원 리스트 초기화

```python
board = [[0] * M for _ in range(N)]
visited = [[False] * M for _ in range(N)]
```

이렇게 하면 안 됨:

```python
board = [[0] * M] * N
```

각 행이 같은 리스트를 참조하기 때문에 한 행을 수정하면 다른 행도 같이 바뀔 수 있음.

### 슬라이싱

```python
arr[start:end]

arr[:k]
arr[k:]

arr[::-1]
```

```text
start 포함
end 미포함
```

### 리스트 뒤집기

원본 변경:

```python
arr.reverse()
```

새 리스트:

```python
reversed_arr = arr[::-1]
```

### 특정 값 제거

```python
arr.remove(x)
```

`remove()`는 첫 번째 `x`만 제거하고 `O(N)`.

여러 값을 제거:

```python
remove_set = {3, 5}

arr = [x for x in arr if x not in remove_set]
```

### 값 존재 여부

```python
if x in arr:
    pass
```

존재 여부를 여러 번 확인한다면 `set` 고려.

---

## 4. String

### 기본

```python
s = "hello"

len(s)

s[0]
s[-1]

s[::-1]
```

문자열은 수정 불가능.

```python
# s[0] = "H"  # 불가능
```

### 문자열 나누기

```python
s.split()
s.split(",")
```

### 문자열 합치기

```python
arr = ["a", "b", "c"]

"".join(arr)
# abc

" ".join(arr)
# a b c
```

### 문자 바꾸기

```python
s = s.replace("a", "b")
```

### 숫자 / 문자 확인

```python
s.isdigit()
s.isalpha()
s.isalnum()
```

```text
isdigit() → 숫자로만 구성
isalpha() → 문자로만 구성
isalnum() → 문자 또는 숫자로만 구성
```

### 대소문자

```python
s.upper()
s.lower()
```

### 개수 / 찾기

```python
s.count("a")

s.find("abc")
```

`find()`는 없으면 `-1`.

---

## 5. Tuple / Set / Dict

### Tuple

```python
t = (1, 2)

a, b = t
```

자주 보는 형태:

```python
(cost, node)
(x, y)
```

### Set

→ 중복 제거 / 존재 확인

```python
s = set(arr)

s.add(x)

if x in s:
    pass
```

집합 연산:

```python
a | b    # 합집합
a & b    # 교집합
a - b    # 차집합
```

삭제:

```python
s.discard(x)
```

순서 유지하면서 중복 제거:

```python
arr = list(dict.fromkeys(arr))
```

### Dict

```python
d = {}

d[key] = value

if key in d:
    pass
```

키가 없을 수도 있다면:

```python
d.get(key, 0)
```

개수 세기:

```python
d[x] = d.get(x, 0) + 1
```

순회:

```python
for key in d:
    pass

for key, value in d.items():
    pass
```

```python
d.keys()
d.values()
d.items()
```

---

## 6. 반복문에서 자주 쓰는 문법

### range

```python
for i in range(N):
    pass
```

```text
0 ~ N-1
```

1부터 N까지:

```python
for i in range(1, N + 1):
    pass
```

역순:

```python
for i in range(N - 1, -1, -1):
    pass
```

### enumerate

→ 인덱스 + 값

```python
for i, x in enumerate(arr):
    print(i, x)
```

### zip

→ 여러 리스트 동시에 순회

```python
for a, b in zip(arr1, arr2):
    print(a, b)
```

### 2차원 배열 전치

```python
transposed = list(zip(*matrix))
```

### 변수 교환

```python
a, b = b, a
```

### 연속 부등호

```python
if 0 <= x < N:
    pass
```

격자:

```python
if 0 <= nx < N and 0 <= ny < M:
    pass
```

---

## 7. any / all

### any

→ 하나라도 True

```python
if any(x > 10 for x in arr):
    pass
```

### all

→ 전부 True

```python
if all(x > 0 for x in arr):
    pass
```

---

## 8. 정렬 문법

> 정렬 활용은 알고리즘 기본편 참고

### 기본

```python
arr.sort()
arr.sort(reverse=True)

new_arr = sorted(arr)
```

### 특정 기준

```python
arr.sort(key=lambda x: x[1])
```

### 여러 조건

```python
arr.sort(key=lambda x: (-x[1], x[0]))
```

```text
-x[1] → 큰 순서
 x[0] → 작은 순서
```

기타:

```python
words.sort(key=len)
arr.sort(key=abs)
```

---

## 9. 자주 쓰는 표준 라이브러리

### collections

#### deque

```python
from collections import deque

q = deque()

q.append(x)
x = q.popleft()
```

#### Counter

```python
from collections import Counter

cnt = Counter(arr)

cnt[x]

cnt.most_common(1)
# [(값, 개수)]
```

예:

```python
cnt = Counter([1, 1, 1, 2, 2])

cnt.most_common(1)
# [(1, 3)]
```

#### defaultdict

```python
from collections import defaultdict

d = defaultdict(int)
d[x] += 1
```

리스트 저장:

```python
d = defaultdict(list)
d[key].append(value)
```

### itertools

> 완전탐색 활용은 알고리즘 기본편 참고

```python
from itertools import combinations, permutations, product

combinations(arr, k)       # 선택 + 순서 X
permutations(arr, k)       # 선택 + 순서 O
product(arr, repeat=k)     # 중복 선택 O + 순서 O
```

### heapq

> 자세한 활용은 알고리즘 기본편 참고

```python
import heapq

heap = []

heapq.heappush(heap, x)
x = heapq.heappop(heap)
```

최대 힙:

```python
heapq.heappush(heap, -x)
x = -heapq.heappop(heap)
```

### bisect

> 이진탐색은 알고리즘 기본편 참고

```python
from bisect import bisect_left, bisect_right

left = bisect_left(arr, target)
right = bisect_right(arr, target)
```

특정 값 개수:

```python
count = bisect_right(arr, target) - bisect_left(arr, target)
```

### math

```python
import math

math.gcd(a, b)
math.lcm(a, b)

math.sqrt(x)
math.factorial(n)

math.ceil(x)
math.floor(x)
```

---

## 10. 복사

### 1차원 리스트

```python
b = a[:]
```

또는:

```python
b = a.copy()
```

### 2차원 리스트

행 내부 값까지 독립적으로 복사:

```python
b = [row[:] for row in a]
```

단순히:

```python
b = a[:]
```

만 하면 내부 리스트는 공유됨.

### 깊은 중첩 구조

```python
import copy

b = copy.deepcopy(a)
```

```text
1차원
→ a[:] / a.copy()

일반적인 2차원 리스트
→ [row[:] for row in a]

복잡한 중첩 구조 전체
→ copy.deepcopy()
```

---

## 11. 재귀

DFS 등 재귀가 깊어질 수 있다면:

```python
import sys

sys.setrecursionlimit(10**6)
```

---

## 12. 반올림 / 올림 / 내림

### round

```python
round(2.5)
# 2

round(3.5)
# 4
```

Python의 `round()`는 `0.5면 무조건 올림`이 아님.

소수점 자리:

```python
round(123.456, 2)
# 123.46
```

> 부동소수점 오차 때문에 경계값의 반올림은 문제 조건을 확인

### 올림 / 내림

```python
import math

math.ceil(3.1)
# 4

math.floor(3.9)
# 3
```

### 양의 정수 나눗셈 올림

```python
(a + b - 1) // b
```

예:

```python
(10 + 3 - 1) // 3
# 4
```

---

## 13. 자주 하는 실수

```text
2차원 리스트

X → [[0] * M] * N
O → [[0] * M for _ in range(N)]

Queue

X → list.pop(0)
O → deque.popleft()

sort()
→ 원본 변경
→ 반환값 None

sorted()
→ 새로운 리스트 반환

문자열
→ 수정 불가능

set
→ 순서를 기대하지 않기

격자 범위
→ 0 <= nx < N and 0 <= ny < M

빈 stack / queue
→ pop 전에 비어 있는지 확인

재귀 DFS
→ setrecursionlimit 확인

round()
→ 0.5가 항상 올라가는 것이 아님
```

---

## 14. 시험 직전 암기

```text
입력
→ map(int, input().split())

빠른 입력
→ sys.stdin.readline

몫 / 나머지
→ // / %

몫 + 나머지
→ divmod()

최대 / 최소 / 합
→ max / min / sum

2차원 리스트
→ [[0] * M for _ in range(N)]

뒤집기
→ arr[::-1]

인덱스 + 값
→ enumerate

여러 리스트 같이
→ zip

리스트 → 문자열
→ "".join(arr)

큐
→ deque
→ append / popleft

빈도
→ Counter / dict.get()

최대공약수
→ math.gcd

최소공배수
→ math.lcm

2차원 복사
→ [row[:] for row in a]

깊은 중첩 복사
→ copy.deepcopy

재귀 DFS
→ sys.setrecursionlimit(10**6)

양의 정수 나눗셈 올림
→ (a + b - 1) // b
```