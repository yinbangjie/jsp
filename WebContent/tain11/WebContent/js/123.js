//登录界面
function checkAll_01(){
	if(!checkUserName() || !checkPasswork() ||!checValidationCode()){
		return false;
	}else {
		return true;
	}
}
//注册界面
function checkAll_02() {
	if(!checkUserName() || !checkPasswork()|| !checkClientSex||!checkClientTeiephone || !checkClientEmail()) {
		return false;
	} else {
		return true;
	}
}
//用户名
function checkUserName() {
	var uName = document.getElementById("userName");

	if(uName.value.trim().length == 0) {
		alert("用户昵称不能为空！");
		uName.focus();
		return false;
	}
	if(uName.value.trim().length < 4 || uName.value.trim().length > 12) {
		alert("昵称无效，应该是4-12个字符");
		return false;
	}

	return true;
}
//密码
function checkPasswork() {
	var uPasswork = document.getElementById("password");
	var uPasswork2 = document.getElementById("password2");

	if(uPasswork.value.trim().length == 0) {
		alert("密码不能为空！");
		uPasswork.focus();
		return false;
	}
	if(uPasswork.value.trim().length < 6 || uPasswork.value.trim().length > 16) {
		alert("密码无效，应该是6-16个字符");
		return false;
	}
	if(uPasswork.value.trim() != uPasswork2.value.trim()) {
		alert("密码不一致！");
		return false;
	}

	return true;
}
//验证码
function checValidationCode() {
	var uValidationCode = document.getElementById("validationCode")
	var uValidationCode2 = document.getElementById("validationCode2")
	if(uValidationCode.value.trim().length == 0){
		alert("验证码不能为空，请输入验证码！");
		uValidationCode.focus();
		return false;
	}
	if(uValidationCode.value.trim() !=uValidationCode2.value.trim()){
	alert("请输入正确的验证吗！！");
	uValidationCode.focus();
	return false;
    }
	return true;
	}
//姓名
function checkClientName() {
	var uClientName = document.getElementById("clientName");

	if(uClientName.value.trim().length == 0) {
		alert("姓名不能为空！");
		uClientName.focus();
		return false;
	}
	if(uClientName.value.trim().length < 2 || uClientName.value.trim().length > 12) {
		alert("姓名无效，应该是2-12个字符");
		return false;
	}

	return true;
}
//性别
function checkClientSex() {
	var uClientSex = document.getElementById("clientSex");
    var da = /[\u4e00-\u9fa5]$/;
    var String titie1 = "男";
    var String titie2 = "女";
	if(uClientSex.value.trim().length == 0) {
		alert("性别不能为空！");
		uClientSex.focus();
		return false;
	}
	if(da.test(uClientSex.value)==false) {
		alert("性别必须是中文！");
		return false;
	}
	if(uClientSex.equals(titie1&&titie2)==false){
		alert("性别必须是男或女！");
		return false;
	}

	return true;
}
//邮箱
function checkClientEmail() {
	var uClientEmail = document.getElementById("clientEmail");    
    var reg = /\w+([-+.]\w*@\w+)*\.\w+([-.]\w+)*$/;
    if(uClientEmail.value.trim().length == 0) {
		alert("邮箱不能为空！");
		uClientEmail.focus();
		return false;
	}   
    
	if (reg.test(uClientEmail.value)==false) {
		alert("邮箱格式不对！");
		uClientEmail.focus();
		return false;
	}
	
	return true;
}
//电话
function checkClientTeiephone(){
	var uPhone = document.getElementById("clientTeiephone");
	var ad = /^((d{3,4})|d{3,4}-)?d{7,8}$/;
	if(uPhone.value.trim().length ==0){
	alert("邮箱不能为空！");
	uPhone.focus();
	return false;
}
	if (ad.test(uPhone.value)==false) {
		alert("邮箱格式不对！");
		uPhone.focus();
		return false;
	}
	
	return true;
}
