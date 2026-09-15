---
title: "컴퓨터 구조 학습 지도"
date: 2026-05-01
categories: [CS, 컴퓨터 구조]
tags: [컴퓨터 구조]
toc: true
mermaid: true
comments: false
---

컴퓨터가 데이터를 표현하고 명령어를 실행하는 과정을 공부한다. CPU, 메모리, 저장장치가 각각 어떤 일을 하는지 정리한다.

## 개념 지도

```mermaid
flowchart LR
    architecture["컴퓨터 구조"] --- overview["컴퓨터 구조의 큰 그림"]
    architecture --- information["컴퓨터가 이해하는 정보"]
    information --- data["데이터"]
    data --- numbers["0과 1로 숫자 표현하기"]
    numbers --- integers["정수"]
    numbers --- realNumbers["실수"]
    data --- characters["0과 1로 문자 표현하기"]
    information --- instruction["명령어"]
    instruction --- instructionTypes["명령어의 종류"]
    instruction --- instructionCycle["명령어 사이클"]
    architecture --- components["컴퓨터의 핵심 부품"]
    components --- cpu["CPU"]
    cpu --- cpuParts["주요 구성 요소"]
    cpu --- cpuTechniques["빠른 명령어 처리를 위한 기술"]
    components --- memory["메모리와 캐시 메모리"]
    memory --- ram["RAM"]
    memory --- endianness["엔디언<br/>여러 바이트로 된 데이터를 메모리에 저장하는 순서"]
    memory --- cache["캐시 메모리"]
    components --- storage["보조기억장치"]
    storage --- raid["RAID<br/>여러 저장장치를 묶어 구성하는 기술"]
    components --- io["입출력장치"]
    io --- ioTechniques["입출력 기법"]
```

<br>

<!-- ## 공부 순서

1. [데이터 표현과 바이트 순서]({% post_url cs/computer-architecture/2026-08-01-data-representation-endianness %})
1. [CPU와 명령어 실행]({% post_url cs/computer-architecture/2026-08-02-cpu-instruction-cycle %})
1. [메모리 계층과 캐시]({% post_url cs/computer-architecture/2026-08-03-memory-hierarchy-cache %})
1. [CPU 성능과 명령어 병렬 처리]({% post_url cs/computer-architecture/2026-08-04-cpu-performance-pipelining %})
1. [인터럽트와 DMA]({% post_url cs/computer-architecture/2026-08-05-interrupts-dma %})
1. [RAID와 디스크 장애 대응]({% post_url cs/computer-architecture/2026-08-06-raid-storage %}) -->

[전체 CS 학습 지도로 돌아가기]({% post_url cs/2026-05-01-cs %})
