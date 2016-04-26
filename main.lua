local composer = require "composer" --외부 모듈 포함
composer.setVariable("BGM", 50)
composer.gotoScene("MainScene", "fade", 500)  --1.가고 싶은 씬, 2.어떤 식으로 나타나는가, 3.진행되는 시간(1000이 1초)