# RaspberryPi 하드웨어 구현하기   

### 🛎필요부품   
- 라즈베리파이 4   
- 브레드 보드   
- TCS3200 컬러감지 센서 모듈 GY-31   
- 스위치   
- 점퍼케이블(M/M), (M/F)   
- 기타   

### 🛎전체 설계도   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/pasted.png" width="40%" height="40%">   

### 🛎TCS3200 컬러 감지 센서모듈 GY-31   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/TCS.jpg" width="40%" height="40%">   
- 컬러 감지 센서 모듈   

    * 기본적인 로직은 S2와 S3의 값의 높낮이로 칼라값을 읽어옴   
    * S2-Low, S3-Low이면 RED값 생성   
    * S2-High, S3-High이면 GREEN값 생성   
    * S2-Low, S3-High이면 BLUE값 생성    

### 🛎부품 연결도   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/pasted2.png" width="40%" height="40%">   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/ras1.jpg" width="30%" height="30%">   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/ras3.jpg" width="30%" height="30%">
스위치 연결   
<img src = "https://github.com/hyojin-park24/MiniProject_SimpleMRP/blob/main/images/ras2.jpg" width="30%" height="30%">   

### 🛎연결 순서   
- TCS3200 VCC 하나를 빵판 +에 연결합니다   
- GND를 빵판 -에 연결합니다   
- S0를 빵판 -와 연결합니다   
- S1을 빵판 +와 연결합니다   
- LED를 빵판 +와 연결합니다   
- S2를 Pi 23번과 연결합니다   
- S3를 Pi 24번과 연결합니다   
- Out을 Pi 25번과 연결합니다   
- 스위치의 한쪽 단자는 빵판의 +와 나머지 단자는 Pi의 VCC와 연결합니다   
- 빵판 -와 Pi GND를 연결합니다
