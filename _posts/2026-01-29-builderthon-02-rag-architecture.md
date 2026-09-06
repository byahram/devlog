---
title: "[예선] 02. RAG 기반 AI 플랫폼 'Rewatch': 기술 스택과 아키텍처"
date: 2026-01-29 00:00:00 +0900
categories: [기타, 2026 Builderthon]
tags: [Fastcampus, Builderthon, Rewatch, AI, RAG, Next.js, Node.js, Supabase, OpenAI, 회고]
toc: true
mermaid: true
image:
  path: /assets/img/thumbnails/builderthon-2026-02-rag-architecture.png
  alt: "Fastcampus Builderthon 2026 예선 02 — RAG 기반 AI 플랫폼 Rewatch의 기술 스택과 아키텍처"
---

지난 글에선 기획 배경을 다뤘고, 이번엔 **1월 12일 팀 확정 직후 96시간(MVP)** 이라는 타임 어택 상황에서 어떻게 개발 환경을 셋팅하고 프로덕트를 구현했는지 정리했다.

핵심 챌린지는 **"비정형 데이터인 '영상'을 어떻게 검색 가능한 데이터로 변환하고, 사용자의 의도를 파악해 정확한 타임스탬프를 찾아줄 것인가"** 였다.

![Rewatch 서비스 화면: 영상 재생, 영상 내용 질문하기, 복습 노트](/assets/img/posts/builderthon-2026-02.png)

---

# 1. 기술 스택

짧은 시간 내에 안정적인 시스템을 구축하기 위해, 생산성이 높은 **Next.js + Node.js** 조합을 선택했고, 복잡한 인프라 구축 대신 **Supabase** 의 관리형 벡터 기능을 적극 활용했다.

### Core AI & LLM

- **OpenAI gpt-4o**: 사용자 질문의 의도를 파악하고, 추출된 문맥을 바탕으로 최종 답변을 생성한다.
- **Prompt Engineering**: 할루시네이션 방지를 위해, 제공된 스크립트 내에서만 답변하고 반드시 출처(타임스탬프)를 포함하도록 제약 조건을 걸었다.

### **Video & Audio Processing**

- **OpenAI Whisper**: `yt-dlc`로 추출한 MP3 파일을 텍스트로 변환(STT)한다. 단순 텍스트뿐만 아니라 정밀한 타임스탬프를 확보하는 것이 핵심이다.

### **RAG Pipeline & Database**

- **OpenAI text-embedding-3**: 변환된 텍스트 청크와 사용자 쿼리를 고차원 벡터로 변환한다.
- **Supabase (PostgreSQL / pgvector)**: 벡터 저장소로 활용했다. 특히 `match_documents` 함수를 활용해 별도의 검색 엔진 구축 없이 시맨틱 검색을 구현했다.

### Backend & Frontend

- **Node.js (Express):**: 영상 처리 및 OpenAI/Supabase API 연동을 위한 서비스 로직을 담당한다.
- **Next.js + TypeScript**: 안정적인 타입 시스템 기반의 웹 애플리케이션 프레임워크.
- **TailwindCSS**: 반응형 UI/UX를 신속하게 구현하기 위해 사용.

---

## 2. 시스템 아키텍처 및 데이터 파이프라인

비정형 데이터(영상)를 정형 데이터(벡터)로 변환하는 파이프라인이 시스템의 핵심이다.

```code snippet
graph TD
    User([User])
    
    subgraph Ingestion [Ingestion Pipeline: 영상 데이터화]
        URL[YouTube URL] --> Audio[Audio Extraction]
        Audio --> Whisper[OpenAI Whisper (STT)]
        Whisper --> Script[Script & Timestamp]
        Script --> Chunk[단어 수 기반 Chunking]
        Chunk --> Embed[Embedding (text-embedding-3)]
        Embed --> DB[(Supabase Vector DB)]
    end
    
    subgraph Retrieval [Retrieval Pipeline: 의미 기반 검색]
        Query[User Query] --> Q_Embed[Query Embedding]
        Q_Embed --> Match[Supabase match_documents]
        DB --> Match
        Match --> Context[Context Extraction]
        Context --> GPT[GPT-4o Generation]
        GPT --> Answer[Answer + Timestamp]
    end

    User -- 질문 --> Query
    Answer -- 결과 --> User
```

### 2-1. 비정형 데이터의 구조화

영상을 검색 가능하게 만들기 위해 오디오로 변환 후 Whisper를 통해 텍스트화했다. 이때 검색 결과가 영상의 특정 시점과 즉시 연결될 수 있도록, 스크립트를 **단어 수 기반 청킹 알고리즘** 으로 분할하여 벡터화했다.

### 2-2. 시맨틱 검색 구현

단순 키워드 매칭은 한계가 명확했다. 예를 들어 사용자가 **"상태 관리"** 라고 질문했으나, 영상에서는 **"데이터 흐름 제어"** 라고 표현된 경우, 키워드 검색은 실패한다. 우리는 `text-embedding-3`와 Supabase의 벡터 연산을 통해 **문맥적 유사성** 을 계산하여, 단어가 달라도 질문 의도와 가장 가까운 구간을 추출하도록 구현했다.

---

## 3. 주요 기능 구현 및 해결 과정

### AI 환각 제어와 검증 시스템

AI 챗봇의 고질적인 문제는 '거짓 답변'이다. 이를 해결하기 위해 두 가지 장치를 마련했다.

- **Strict Prompting**: GPT-4o가 반드시 제공된 스크립트 내에서만 답변하도록 강제했다.
- **타임스탬프 검증**: 답변과 함께 타임스탬프를 제공한다. 사용자는 이를 클릭해 원본 영상을 즉시 재생함으로써 AI의 답변을 직접 검증 할 수 있다.

### 복습 노트

사용자 경험(UX)은 단순히 '검색'에서 끝나지 않는다.

- **User Flow**: 질문 -> 답변/타임스탬프 확인 -> 영상 재생 -> 자동 저장
- 모든 질의응답은 `review_notes` 테이블에 타임스탬프와 함께 저장된다. 이를 통해 사용자는 긴 강의를 다시 탐색할 필요 없이, 본인이 어려워했던 구간만 모아둔 개인 맞춤형 학습 노트를 확보하게 된다.

---

## 4. 회고 및 한계점

96시간이라는 촉박한 일정 속에서 '기능 구현'과 '품질' 사이의 트레이드오프가 있었다.

1. **청킹 전략의 한계**: 현재 적용된 단어 수 기반 청킹은 구현이 빠르지만, 문맥이 중간에 끊길 위험이 있다. 향후 문단의 의미 단위로 자르는 Semantic Chunking을 도입해 정확도를 개선할 예정이다.
2. **검색 정확도**: 키워드 불일치 문제는 시맨틱 검색으로 해결했지만, 여전히 유사한 문맥이 많은 긴 영상에서는 Noise가 섞일 수 있다. Reranking 등의 기법 도입을 고려 중이다.

---

## 5. 마치며...

이번 프로젝트는 **"AI가 학습을 돕고 실무에 즉시 연결되는 시대"** 라는 패스트캠퍼스의 비전과 맞닿아 있다. 영상을 단순히 '보는' 것에서 '탐색하고 소유하는' 데이터로 바꾼 이 시도가, 향후 VOD 학습 경험을 어떻게 바꿀지 기대된다.

[Github Repository](https://github.com/byahram/builderthon2026-pre)
