const form = document.savingCreateForm;
const limitBlock = document.querySelector(".limitWrapper");
const resultBlock = document.querySelector(".resultWrapper");
const warningTxt = document.querySelector(".warningText2");
const calculBtn = document.querySelector(".calculBtn");

const tableTerm = document.querySelector(".totalLength");
const tableMoney = document.querySelector(".totalLoanMoney");
const tablePrincipal = document.querySelector(".totalPrincipal2");
const tableInterest = document.querySelector(".totalInterest2");

document.querySelector(".checkLimitBtn").addEventListener('click', ()=>{
	limitBlock.style.display = "block";
});

document.querySelector(".calculBtn").addEventListener('click', ()=>{
	if (form.monthly.value > 100000000) {
		warningTxt.textContent = "최대 1억원까지 대출이 가능합니다.";
		warningTxt.style.display = "block";
		return;
	}
	
	if (form.monthly.value < 1000000) {
		warningTxt.textContent = "최소 100만원부터 대출이 가능합니다.";
		warningTxt.style.display = "block";
		return;
	}
	resultBlock.style.display = "block";
	const principal = form.monthly.value;
	const interest = (359 / 10000);
	const term = form.term.value;
	
	// 총 기간
	document.querySelector(".totalTerm").textContent = term;
	
	// 총 값아야 할 돈
	document.querySelector(".totalPrincipal").value = (Number(principal) + Math.floor(principal * interest)).toLocaleString();
	
	// 한달에 원금+이자 합쳐서 얼마씩 내야하나
	form.monthly2.value = Math.floor(Number(principal) / term) + Math.floor(principal * interest / term);
	document.querySelector(".totalInterest").value = (Math.floor(principal * interest)).toLocaleString();
	
	tableTerm.textContent = term;
	tableMoney.textContent = Number(form.monthly2.value).toLocaleString() + "원";
	tablePrincipal.textContent = (Math.floor(Number(principal) / term)).toLocaleString() + "원";
	tableInterest.textContent = (Math.floor(principal * interest / term)).toLocaleString() + "원";
});

document.querySelectorAll(".moneyBtns button").forEach((btn)=>{
	btn.addEventListener('click', (e)=>{
		const totalMoneyInput = form.monthly;
		totalMoneyInput.value = Number(totalMoneyInput.value) + Number(e.currentTarget.dataset.money);
		console.log(totalMoneyInput.value);
		resultBlock.style.display = "none";
		calculBtn.removeAttribute("disabled");
		if (totalMoneyInput.value > 100000000) {
			warningTxt.textContent = "최대 1억원까지 대출이 가능합니다.";
			warningTxt.style.display = "block";
			calculBtn.setAttribute("disabled", true);
			return;
		}
		
		if (totalMoneyInput.value < 1000000) {
			warningTxt.textContent = "최소 100만원부터 대출이 가능합니다.";
			warningTxt.style.display = "block";
			calculBtn.setAttribute("disabled", true);
			return;
		}
		
		warningTxt.style.display = "none";
	});
});

form.term.addEventListener('change', ()=>{
	resultBlock.style.display = "none";
})

form.monthly.addEventListener('input', ()=>{
	resultBlock.style.display = "none";
	if (form.monthly.value > 100000000) {
		warningTxt.textContent = "최대 1억원까지 대출이 가능합니다.";
		warningTxt.style.display = "block";
		calculBtn.setAttribute("disabled", true);
	} else if (form.monthly.value < 1000000) {
		warningTxt.textContent = "최소 100만원부터 대출이 가능합니다.";
		warningTxt.style.display = "block";
		calculBtn.setAttribute("disabled", true);
	} else {
		warningTxt.style.display = "none";
		calculBtn.removeAttribute("disabled");
	}
})
