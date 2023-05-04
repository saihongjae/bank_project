let form = document.memberAddForm;

function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        //alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
        obj.focus();
        obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
        return false;
    }
}
		
form.addEventListener('submit', (e)=>{
	if (form.name.value.trim() == "") return false;
	if (form.pw.value !== form.pw2.value) return false;
})

form.addEventListener('keydown',(e)=>{
	e.target.addEventListener('change', ()=>{
		noSpaceForm(e.target);
	})
});
	
form.pw2.addEventListener("blur", ()=>{
	const warningTxt = document.querySelector(".warningTxt");
	if (form.pw.value !== form.pw2.value) {				
		warningTxt.style.display = "block";
	} else {
		warningTxt.style.display = "none";
	}
});
		
document.querySelector("#cancelBtn").addEventListener('click', ()=>{
	// 회원가입 취소하면 메인페이지로 돌아갈 수 있게
	// location.href="";
});
		
form.emailAddrs.addEventListener('change', (e)=>{
	if (e.target.value === "") {
		form.emailAddr.value = "";
		form.emailAddr.removeAttribute("disabled");
	} else {
		form.emailAddr.disabled = "true";
		form.emailAddr.value = e.target.value;
	}
});