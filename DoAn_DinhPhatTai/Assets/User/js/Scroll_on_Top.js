// JavaScript Document
window.onscroll = function() {
	Scroll_Function();	
}

function Scroll_Function() {
	if (document.body.scrollTop>10 || document.documentElement.scrollTop>10) {
		document.getElementById("Bam_len_top").style.display = "block";
		document.getElementById("Trang_gio_hang").style.display = "block";
	}
	else {
		document.getElementById("Bam_len_top").style.display = "none";
		document.getElementById("Trang_gio_hang").style.display = "none";
	}
}

function Dua_len_dau() {
	document.body.scrollTop=0;
	document.documentElement.scrollTop=0;
}