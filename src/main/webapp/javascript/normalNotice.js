const form = document.savingCreateForm;
const warningTxt = document.querySelector(".warningText2");
const cancelBtn = document.querySelector(".cancelBtn");

function checkFormValidate() {
	const consent1 = document.querySelector(".consent1");
    const consent2 = document.querySelector(".consent2");
    
    if (!consent1.checked || !consent2.checked) {
        alert("필수 항목의 동의가 필요합니다.");
        return false;
    } 
    
    if (form.pw1.value != form.pw2.value) {
		const warningTxt = document.querySelector(".warningText1");
		warningTxt.style.display = "block";
		return false;
	}
	
    return true;
}

form.addEventListener('submit', (e)=>{
	if (!checkFormValidate()) e.preventDefault();
});

cancelBtn.addEventListener('click', ()=>{
	let isCanceled = confirm("통장 개설을 취소하시겠습니까? 입력된 정보가 초기화 될 수 있습니다");
	if (isCanceled) {
		location.href = "main.jsp";
		form.reset();
	}
});
