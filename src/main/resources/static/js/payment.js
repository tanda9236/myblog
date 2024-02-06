// 결제
$(document).ready(function() {
IMP.init("imp77230284");
const pay = document.getElementById("pay-btn");

const onClickPay = async () => {
	let nickname = $("#nickname").val();
	let email = $("#email").val();
	let price = $("#price").val();
	let payeeId = $("#payeeId").val();
	
	IMP.request_pay({
		pg: "kakaopay",
		pay_method: "card",
		merchant_uid: "payment_" + new Date().getTime(),
		amount: price,
		name: "블로그후원" + payeeId,
		buyer_name: nickname,
		buyer_email: email
	}, function(resp){
		console.log(resp);

		if(resp.success){
			var msg = '결제가 완료되었습니다.';
			let data = {
					amount: resp.paid_amount,
					productName: "블로그후원" + payeeId,
					payMethod: resp.pg_provider,
					merchantUid: resp.merchant_uid // 일단 결제검증은 다음에
				};
			$.ajax({
				type: 'POST',
				url: '/blogDonate',
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			});
		}else{
			var msg = '결제에 실패하였습니다.';
			msg += resp.error_msg;
		}
		alert(msg);
	});
};
pay.addEventListener("click", onClickPay);

});