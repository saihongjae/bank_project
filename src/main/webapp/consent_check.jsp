<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script	src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js">
</script>
<title>삼조은행</title>
</head>
<body>
<script>

            const consent1 = document.querySelector(".consent1");
            const consent2 = document.querySelector(".consent2");
            
            if(!consent1.checked){
            	  if(!consent2.checked){
            		  Swal.fire({
            			  icon: 'info',
            			  title: "필수 항목의 동의가 필요합니다."
            			})
            		  setTimeout("location.replace('login_tap.jsp')",1000);
            	  }
            }
        })
    </script>
</body>
</html>