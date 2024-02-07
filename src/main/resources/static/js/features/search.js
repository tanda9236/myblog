// 검색(닉네임)
const dataList = userListNickname;
const dataUrl = userListId;

const $search = document.querySelector("#search");
const $autoComplete = document.querySelector(".autocomplete");

let nowIndex = 0;

$search.onkeyup = (event) => {
	const value = $search.value.trim(); // 검색어
	const matchDataList = value // 자동완성 필터링
		? dataList.filter((label) => label.includes(value))
		: [];
	switch (event.keyCode) {
		case 38: // UP KEY
			nowIndex = Math.max(nowIndex - 1, 0);
			break;
		case 40: // DOWN KEY
			nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
			break;
		case 13: // ENTER KEY
			var activeDiv = document.querySelector(".active");
			if (activeDiv) {
				activeDiv.click();
				}
			break;
		default:
			nowIndex = 0;
			break;
	}
	showList(matchDataList, value, nowIndex); // 리스트 보여주기
};

const showList = (data, value, nowIndex) => {
	const regex = new RegExp(`(${value})`, "g");
	$autoComplete.innerHTML = data
		.map(
			(label, index) => `
      <div class='${nowIndex === index ? "active" : ""}' onclick="navigateTo('${dataUrl[dataList.indexOf(label)]}')">
        ${label.replace(regex, "<mark>$1</mark>")}
      </div>
    `
		)
		.join("");
};

const navigateTo = (url) => {
	window.location.href = url;
};
