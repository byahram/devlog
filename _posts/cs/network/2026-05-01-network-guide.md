---
title: "[NW] 0. 네트워크 학습 지도"
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

    network --- link["물리 계층과<br/>데이터 링크 계층"]
    link --- ethernet["이더넷"]
    link --- physical["(물리 계층)<br/>유무선 통신 매체"]
    link --- datalink["(데이터 링크 계층)<br/>이더넷 프레임"]
    link --- devices["다양한 네트워크 장비"]
    devices --- nic["NIC"]
    devices --- hub["허브"]
    devices --- switch["스위치"]

    network --- ip_layer["네트워크 계층"]
    ip_layer --- ip_features["IP의 목적과 특징"]
    ip_layer --- ip_addr["IP 주소"]
    ip_addr --- ip_struct["IP 주소의 구조"]
    ip_struct --- classful["클래스풀 주소 체계"]
    ip_struct --- classless["클래스리스 주소 체계와<br/>서브넷 마스크"]
    ip_addr --- ip_types["IP 주소의 종류:<br/>공인 IP 주소와 사설 IP 주소"]
    ip_addr --- ip_alloc["IP의 할당"]
    ip_alloc --- static_alloc["정적 할당"]
    ip_alloc --- dhcp["동적 할당: DHCP"]
    ip_layer --- icmp["ICMP"]
    ip_layer --- arp["ARP"]

    network --- transport["전송 계층"]
    transport --- tcp["TCP"]
    tcp --- tcp_feat["TCP의 목적과 특징"]
    tcp --- tcp_conn["TCP의 연결 수립과 종료"]
    tcp --- tcp_ctrl["TCP의 오류·흐름·혼잡 제어"]
    tcp --- tcp_state["TCP의 상태 관리"]
    transport --- udp["UDP"]
    udp --- udp_feat["UDP의 목적과 특징"]

    network --- app["응용 계층"]
    app --- dns["DNS와 URI/URL"]
    app --- http["HTTP"]
    http --- http_feat["HTTP의 목적과 특징"]
    http --- http_msg["HTTP 메시지 구조"]
    http_msg --- method["메서드"]
    http_msg --- status["상태 코드"]
    http_msg --- headers["주요 헤더"]
    http --- http_tech["HTTP 기반 기술"]
    http_tech --- cookie["쿠키"]
    http_tech --- cache["캐시"]
    http_tech --- content_nego["콘텐츠 협상"]
    app --- https["HTTPS"]
    https --- tls["SSL/TLS"]

    network --- proxy["프록시와<br/>안정적인 트래픽"]
    proxy --- proxy_server["중간 서버"]
    proxy_server --- fwd_proxy["포워드 프록시"]
    proxy_server --- rev_proxy["리버스 프록시"]
    proxy --- stability["안정성"]
    stability --- ha["가용성과 고가용성"]
    stability --- lb["로드 밸런싱"]
    stability --- scaling["스케일링:<br/>스케일 업과 스케일 아웃"]

    protocol ~~~ ethernet
    switch ~~~ ip_features
    arp ~~~ tcp
    udp_feat ~~~ dns
    tls ~~~ proxy_server
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
