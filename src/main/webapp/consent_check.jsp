<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>

            const consent1 = document.querySelector(".consent1");
            const consent2 = document.querySelector(".consent2");
            
            if(!consent1.checked){
            	  if(!consent2.checked){
            		  alert("필수 항목의 동의가 필요합니다.");
                      location.replace('login_tap.jsp');
            	  }
            }
        })
    </script>
</body>
</html>