const form = document.savingCreateForm;
const resultBlock = document.querySelector(".resultWrapper");
const warningTxt = document.querySelector(".warningText2");
const calculBtn = document.querySelector(".calculBtn");

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
	
	if (form.pw1.value == "") return false;
    
    if (form.monthly.value > 100000000 || form.monthly.value < 1000000) return false;
    
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
		if (totalMoneyInput.value > 100000000 || totalMoneyInput.value < 1000000) {
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
	if (form.monthly.value > 100000000) {
		warningTxt.textContent = "최대 예금 금액은 1억원입니다.";
		warningTxt.style.display = "block";
		calculBtn.setAttribute("disabled", true);
	} else if (form.monthly.value < 1000000) {
		warningTxt.textContent = "최소 100만원 이상 예금이 가능합니다.";
		warningTxt.style.display = "block";
		calculBtn.setAttribute("disabled", true);
	} else {
		warningTxt.style.display = "none";
		calculBtn.removeAttribute("disabled");
	}
})

calculBtn.addEventListener('click', ()=>{
	resultBlock.style.display = "block";
	form.principal.value = Number(form.term.value) * Number(form.monthly.value);
	form.interest.value = Number(form.principal.value) * (29/1000);
});
