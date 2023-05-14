const form = document.savingCreateForm;
const resultBlock = document.querySelector(".resultWrapper");
const warningTxt = document.querySelector(".warningText2");
const calculBtn = document.querySelector(".calculBtn");
const cancelBtn = document.querySelector(".cancelBtn");

function checkFormValidate() {
	const consent1 = document.querySelector(".consent1");
    const consent2 = document.querySelector(".consent2");
    
    if (!consent1.checked || !consent2.checked) {
        return false;
    } 
    
    if (form.pw1.value != form.pw2.value) {
		const warningTxt = document.querySelector(".warningText1");
		warningTxt.style.display = "block";
		return false;
	}
	
	if (form.pw1.value == "") {	
		return false;
	} 
    
    if (form.monthly.value > 3000000 || form.monthly.value < 1000) {		
		return false;
	}
    
    return true;
}

form.addEventListener('submit', (e)=>{
	if (!checkFormValidate()) e.preventDefault();
});


document.querySelectorAll(".moneyBtns button").forEach((btn)=>{
	btn.addEventListener('click', (e)=>{
		const totalMoneyInput = form.monthly;
		totalMoneyInput.value = Number(totalMoneyInput.value) + Number(e.currentTarget.dataset.money);
		resultBlock.style.display = "none";
		calculBtn.removeAttribute("disabled");
		if (totalMoneyInput.value > 3000000) {
			warningTxt.style.display = "block";
			calculBtn.setAttribute("disabled", true);
		}
	});
});

form.term.addEventListener('change', (e)=>{
	resultBlock.style.display = "none";
	document.querySelector(".totalTerm").textContent = e.target.value;
})

form.monthly.addEventListener('input', ()=>{
	resultBlock.style.display = "none";
	if (form.monthly.value > 3000000) {
		warningTxt.textContent = "최대 이체 금액은 월 300만원입니다.";
		warningTxt.style.display = "block";
		calculBtn.setAttribute("disabled", true);
	} else if (form.monthly.value < 1000) {
		warningTxt.textContent = "최소 이체 금액은 천 원입니다.";
		warningTxt.style.display = "block";
		calculBtn.setAttribute("disabled", true);
	} else {
		warningTxt.style.display = "none";
		calculBtn.removeAttribute("disabled");
	}
})

calculBtn.addEventListener('click', ()=>{
	resultBlock.style.display = "block";
	form.principal.value = (Number(form.term.value) * Number(form.monthly.value)).toLocaleString();
	form.interest.value = (Number(form.principal.value.replaceAll(",","")) * (38/1000)).toLocaleString();
});

cancelBtn.addEventListener('click', ()=>{
	let isCanceled = confirm("통장 개설을 취소하시겠습니까? 입력된 정보가 초기화 될 수 있습니다");
	if (isCanceled) {
		location.href = "./main.jsp";
		form.reset();
	}
});
