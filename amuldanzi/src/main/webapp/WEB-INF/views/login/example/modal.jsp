<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modal</title>
<style>
dialog::backdrop{
	background-color : rgba(0,0,0,0.3);
	backdrop-filter: blur(1px);
}

dialog{
	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	border: 0;
	text-align: center;
	border-radius: 20px;
	padding: 20px 50px 10px 50px;
	background-color : tomato;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	const button = document.querySelector("button");
	const dialog = document.querySelector("dialog");
	
	button.addEventListener("click",() => {
		dialog.showModal();
	});
	
	dialog.addEventListener("close", () => {
		console.log(dialog.returnValue);
	});
	
});
</script>
</head>
<body>

	<button>Show modal</button>
	<dialog>
		Hello! I am modal!
		<form method="dialog">
			<button value="close">Close</button>
			<button value="confirm">Confirm</button>
		</form>
	</dialog>

</body>
</html>