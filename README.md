# MiniProject_SimpleMRP (6/24~6/30)
SmartFactory 공정관리 with RaspberryPi  
## 🚩 라즈베리파이에서 센싱된 칼라값을 통해 성공(Green)/실패(Red)에 따라 생산공정이 실시간으로 제대로 이루어지는 지 확인할 수 있다
#### 01. 분석 및 설계    
#### 02. 구현   
#### 03. 테스트 
----------------------------------------   
## 01. 분석 및 설계   

#### WBS 작성    
⚡WBS란?   
>work breakdown strucuture - 일스케줄을 의미함   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/mbs.jpg" width="50%" height="50%">

#### 테이블 기본서 작성 
>wbs에 작성한 일정과 같이 과제 선정 및 요구사항정의 그리고 TO-BE산출이 끝난 후 테이블 설계를 진행한다.   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/table.jpg" width="40%" height="40%">   

---------------------------------------

## 02. 구현   

### IoT 디바이스 구성   
#### 🌌 데이터 베이스 모델링   
- 테이블 기본서에 작성된 토대로 데이터베이스 다이어그램을 생성한다.   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/db1.png" width="40%" height="40%">   

#### 🌌 라즈베리파이 하드웨어 구성    
#### [라즈베리파이 하드웨어 구현 따라하기](https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/RaspberryPi/README.md)   
#### [라즈베리파이 기본 소스](https://github.com/hyojin-park24/MiniProject_SimpleMRP/tree/main/Raspberrypi%20code)   

#### 🌌 실행결과   
- 각 색의 값이 가장 작게 나옴   

#### 🌌 MQTT   
- MQTT를 활용한 데이터 연결   

#### 🌌 공정관리 플랫폼 구성   
- MRP (WPF, Winform, Json)을 활용한 모니터링 화면 구성   
##### 1일차 (6/24)   
🟢 DB데몬(서버프로세스) 구축    
  - WPF화면 설계 
  - 누겟페키지 : M2Mqtt , Newtonsoft.Jason, System.Data.SqlClient 다운로드    
  - 왜 다운 했는지 역할 알아보기 



