<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kochat 데모</title>

    <script src="./static/js/bootstrap.js"></script>
    <script src="./static/js/jquery.js"></script>
    <script src="./static/js/main.js"></script>
    <script>
        greet();
        onClickAsEnter();
    </script>
    <link rel="stylesheet" href="./static/css/bootstrap.css">
    <link rel="stylesheet" href="./static/css/main.css">

</head>


<body>
<div class="chat_window">
    <div class="top_menu">
        <div class="buttons">
            <div class="button close_button"></div>
            <div class="button minimize"></div>
            <div class="button maximize"></div>
        </div>
        <div class="title">Kochat 데모</div>
    </div>
    <ul class="messages"></ul>
    <div class="bottom_wrapper clearfix">
        <div class="message_input_wrapper">
            <input class="message_input"
                   onkeyup="return onClickAsEnter(event)"
                   placeholder="내용을 입력하세요."/>
        </div>

        <div class="send_message"
             id="send_message"
             onclick="onSendButtonClicked()">

            <div class="icon"></div>
            <div class="text">보내기</div>
        </div>

    </div>
</div>
<div class="message_template">
    <li class="message">
        <div class="avatar"></div>
        <div class="text_wrapper">
            <div class="text"></div>
        </div>
    </li>
</div>
</body>
</html>