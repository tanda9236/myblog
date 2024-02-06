// 모달창
function openDonate() {
	document.getElementById("myModal").style.display = "block";
}
function closeModal() {
	document.getElementById("myModal").style.display = "none";
}
document.getElementsByClassName("md-close")[0].onclick = function() {
	closeModal();
}
window.onclick = function(event) {
	if (event.target == document.getElementById("myModal")) {
		closeModal();
	}
}