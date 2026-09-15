---
title: "네트워크 학습 지도"
date: 2026-05-01
categories: [CS, 네트워크]
tags: [네트워크]
toc: true
mermaid: true
comments: false
---

내 컴퓨터에서 보낸 데이터가 상대 컴퓨터에 도착하기까지의 과정을 공부한다. 이 과정에서 IP, TCP, HTTP 같은 프로토콜과 네트워크 장비가 하는 일을 정리한다.

## 개념 지도

```mermaid
flowchart LR
    network["네트워크"] --- overview["네트워크의 큰 그림"]
    overview --- layers["네트워크 계층 구조"]
    overview --- protocol["프로토콜"]
    network --- detail["계층별 주요 프로토콜과 네트워크 장비"]
    detail --- link["물리·데이터 링크 계층: 이더넷과 네트워크 장비"]
    detail --- ip["네트워크 계층: IP"]
    detail --- transport["전송 계층: TCP와 UDP"]
    detail --- application["응용 계층: HTTP와 HTTPS"]
    network --- proxy["프록시와 안정적인 트래픽 처리"]
```


<!-- ## 공부 순서

1. [네트워크 계층과 이더넷]({% post_url cs/network/2026-08-17-network-layers-ethernet %})
1. [IP 주소와 패킷 전달]({% post_url cs/network/2026-08-18-ip-addressing-routing %})
1. [TCP와 UDP]({% post_url cs/network/2026-08-19-tcp-udp %})
1. [DNS와 URL]({% post_url cs/network/2026-08-20-dns-url %})
1. [HTTP 요청과 상태 관리]({% post_url cs/network/2026-08-21-http-messages %})
1. [HTTP 캐시와 조건부 요청]({% post_url cs/network/2026-08-22-http-cache-validation %})
1. [HTTPS와 TLS]({% post_url cs/network/2026-08-23-https-tls %})
1. [프록시와 부하 분산]({% post_url cs/network/2026-08-24-proxies-load-balancing %}) -->

[전체 CS 학습 지도로 돌아가기]({% post_url cs/2026-05-01-cs %})
