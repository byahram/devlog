---
title: "[OS] 0. 운영체제 학습 지도"
date: 2026-05-01
categories: [CS, 운영체제]
tags: [운영체제]
toc: true
mermaid: true
comments: false
---

여러 프로그램이 CPU와 메모리를 나눠 쓰는 방식을 공부한다. 프로세스와 스레드, 스케줄링, 동기화, 가상 메모리, 파일 시스템을 정리한다.

## 개념 지도

```mermaid
flowchart LR
    os["운영체제"] --- overview["운영체제의 큰 그림"]
    overview --- kernel["커널"]
    overview --- syscall["시스템 콜"]

    os --- execution["프로세스 및 스레드 관리"]
    execution --- process["프로세스와 스레드"]
    execution --- sync["동기화와 교착 상태"]

    os --- resources["자원 할당 및 관리"]
    resources --- cpu["CPU 관리: CPU 스케줄링"]
    cpu --- cpu_concept["기본 개념<br/>(우선순위, 스케줄링 큐, 선점/비선점)"]
    cpu --- cpu_algo["CPU 스케줄링 알고리즘"]
    cpu --- cpu_linux["리눅스 CPU 스케줄링"]

    resources --- memory["메모리 관리: 가상 메모리"]
    memory --- mem_addr["물리 주소와 논리 주소"]
    memory --- mem_alloc["메모리 할당"]
    memory --- mem_paging["페이징과 페이지 교체 알고리즘"]

    resources --- files["파일/디렉터리 관리: 파일 시스템"]
    files --- file_dir["파일과 디렉터리"]
    files --- file_sys["파일 시스템"]

    sync ~~~ cpu
```


{% comment %}
## 공부 순서

1. [커널과 시스템 콜]({% post_url cs/operating-system/2026-08-07-kernel-system-calls %})
1. [프로세스와 스레드]({% post_url cs/operating-system/2026-08-08-processes-threads %})
1. [동기화와 교착 상태]({% post_url cs/operating-system/2026-08-09-synchronization-deadlock %})
1. [CPU 스케줄링]({% post_url cs/operating-system/2026-08-10-cpu-scheduling %})
1. [가상 메모리와 페이징]({% post_url cs/operating-system/2026-08-11-virtual-memory-paging %})
1. [파일 시스템과 링크]({% post_url cs/operating-system/2026-08-12-file-systems-links %})
{% endcomment %}

[전체 CS 학습 지도로 돌아가기]({% post_url cs/2026-05-01-cs %})
